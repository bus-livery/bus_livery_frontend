import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/horn/model/horn_data_model.dart';
import 'package:livery/features/horn/model/horn_model.dart';
import 'package:livery/features/horn/service/horn_service.dart';
import 'package:livery/utils/bloc_life_cycle.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/router/router.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'horn_event.dart';
part 'horn_state.dart';

@injectable
class HornBloc extends Bloc<HornEvent, HornState> with BlocLifeCycle {
  final IHornService hornService;
  final AppRouter router;

  ScrollController listViewController = ScrollController();

  @override
  void initstate() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      add(FetchAllHornsApiEvent());

      listViewController.addListener(() {
        double pixels = listViewController.position.pixels;
        double maxScrollExtent = listViewController.position.maxScrollExtent;

        if ((pixels / maxScrollExtent) > 0.8) {
          var data = state.getAllHornsRes;
          if (data.apiData?.data?.isNotEmpty ?? false) {
            if (data.paginationLoading == false) {
              if (data.apiData?.currentPages != data.apiData?.totalPages) {
                add(
                  FetchAllHornsApiEvent(
                    pageCount: state.getAllHornsRes.pageCount + 1,
                  ),
                );
              }
            }
          }
        }
      });
    });
  }

  @override
  Future<void> close() {
    customPrint('HORN BLOC CLOSED');
    listViewController.dispose();
    return super.close();
  }

  HornBloc(this.hornService, this.router) : super(HornState.initial()) {
    initstate();

    on<FetchAllHornsApiEvent>(_fetchAllHorns);
    on<FetchMyHornsApiEvent>(_fetchMyHorns);
    on<FetchOthersHornsApiEvent>(_fetchOthersHorns);
    on<CreateHornApiEvent>(_createHorn);
    on<DownloadHornEvent>(_downloadHorn);
  }

  _fetchAllHorns(FetchAllHornsApiEvent event, emit) async {
    emit(
      state.copyWith(
        getAllHornsRes: state.getAllHornsRes.copyWith(
          status:
              event.pageCount == null ? ApiStatus.loading : ApiStatus.success,
          paginationLoading: event.pageCount != null,
        ),
      ),
    );

    final response = await hornService.getAllHornsServiceApi(
      pageCount: event.pageCount,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            getAllHornsRes: state.getAllHornsRes.copyWith(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      (success) {
        final isFirstPage = event.pageCount == null || event.pageCount == 1;

        List<HornModel> currentData = [];
        if (!isFirstPage && state.getAllHornsRes.apiData?.data != null) {
          currentData = List.from(state.getAllHornsRes.apiData!.data!);
        }

        currentData.addAll(success.data ?? []);

        final updatedData = success.copyWith(data: currentData);

        emit(
          state.copyWith(
            getAllHornsRes: ApiResponse(
              status: ApiStatus.success,
              apiData: updatedData,
              pageCount: event.pageCount ?? 1,
              paginationLoading: false,
            ),
          ),
        );
      },
    );
  }

  _fetchMyHorns(FetchMyHornsApiEvent event, emit) async {
    emit(
      state.copyWith(
        getMyHornsRes: ApiResponse(status: ApiStatus.loading),
      ),
    );

    final response = await hornService.getMyHornsServiceApi();

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            getMyHornsRes: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            getMyHornsRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _fetchOthersHorns(FetchOthersHornsApiEvent event, emit) async {
    emit(
      state.copyWith(
        getOthersHornsRes: ApiResponse(status: ApiStatus.loading),
      ),
    );

    final response = await hornService.getOthersHornsServiceApi(
      userId: event.userId,
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            getOthersHornsRes: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            getOthersHornsRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _createHorn(CreateHornApiEvent event, emit) async {
    emit(
      state.copyWith(
        hornCreateRes: ApiResponse(status: ApiStatus.loading),
      ),
    );

    final response = await hornService.createHornServiceApi(event.data);

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            hornCreateRes: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            hornCreateRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _downloadHorn(DownloadHornEvent event, emit) async {
    final horn = event.horn;
    final hornId = horn.id ?? 0;

    final updatedDownloads = Map<int, bool>.from(state.downloadsInProgress);
    updatedDownloads[hornId] = true;
    emit(state.copyWith(downloadsInProgress: updatedDownloads));

    try {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        // Request storage permission
      }

      final response = await Dio().get<List<int>>(
        horn.audioPath,
        options: Options(responseType: ResponseType.bytes),
      );

      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      } else {
        directory = await getDownloadsDirectory();
        directory ??= await getApplicationDocumentsDirectory();
      }

      final ext = horn.audioPath.split('.').last.split('?').first.toLowerCase();
      final sanitizedTitle = horn.title.replaceAll(RegExp(r'[^\w\s\-]'), '');
      final fileName = '${sanitizedTitle}_${DateTime.now().millisecondsSinceEpoch}.$ext';
      final file = File('${directory!.path}/$fileName');
      await file.writeAsBytes(response.data!);

      showSuccessToast(message: 'Horn saved to: ${directory.path}/$fileName');
    } catch (e) {
      customPrint('Error downloading horn: $e');
      showSuccessToast(message: 'Failed to download audio file');
    } finally {
      final updatedDownloads = Map<int, bool>.from(state.downloadsInProgress);
      updatedDownloads.remove(hornId);
      emit(state.copyWith(downloadsInProgress: updatedDownloads));
    }
  }
}
