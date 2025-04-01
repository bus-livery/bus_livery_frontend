import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/livery/model/download_count_model/download_count_model.dart';
import 'package:livery/features/livery/model/livery_model/livery_data_model.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery/service/livery_service.dart';
import 'package:livery/utils/bloc_life_cycle.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/router/router.dart';

part 'livery_event.dart';
part 'livery_state.dart';

@injectable
class LiveryBloc extends Bloc<LiveryEvent, LiveryState> with BlocLifeCycle {
  final ILiveryService liverService;
  final AppRouter router;

  @override
  void initstate() {
    WidgetsBinding.instance.addPostFrameCallback(
      (v) => add(GetAllLiveryApiEvent()),
    );
  }

  @override
  Future<void> close() {
    customPrint('LIVERY BLOC CLOSED');
    return super.close();
  }

  LiveryBloc(this.liverService, this.router) : super(LiveryState.initial()) {
    //
    initstate();
    //

    on<InsetNewLiveryEvent>(_insetNewLiveryEvent);

    on<FilterLiveryEvent>(_filterLiveryEvent);

    // API EVENTS
    on<LiveryEvent>((event, emit) {});

    on<GetAllLiveryApiEvent>(_getAllLiveryApiEvent);

    on<GetSinglelLiveryApiEvent>(_getSinglelLiveryApiEvent);

    on<DeleteLiveryApiEvent>(_deleteLiveryApiEvent);

    on<DownloadLiveryApiEvent>(_downloadLiveryApiEvent);

    on<GetAllDownloadedLiveryApiEvent>(_getAllDownloadedLiveryApiEvent);
  }

  _filterLiveryEvent(FilterLiveryEvent event, emit) {
    emit(state.copyWith(filter: event.filter));

    add(
      GetAllLiveryApiEvent(
        mostDownload: event.filter == LiveryFilter.mostDownloaded,
      ),
    );

    router.maybePop();
  }

  _insetNewLiveryEvent(InsetNewLiveryEvent event, emit) {
    emit(
      state.copyWith(
        getAllLiveryRes: state.getAllLiveryRes.copyWith(
          status: ApiStatus.initial,
        ),
      ),
    );

    var liveryList = state.getAllLiveryRes.apiData?.data?.toList();

    liveryList?.insert(0, event.newData);

    emit(
      state.copyWith(
        getAllLiveryRes: state.getAllLiveryRes.copyWith(
          status: ApiStatus.success,
          apiData: state.getAllLiveryRes.apiData?.copyWith(data: liveryList),
        ),
      ),
    );
  }

  // API EVENT

  _getAllLiveryApiEvent(GetAllLiveryApiEvent event, emit) async {
    emit(
      state.copyWith(getAllLiveryRes: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await liverService.getAllLiveryServiceApi(
      downloads: event.mostDownload,
    );

    response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            getAllLiveryRes: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            getAllLiveryRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _getSinglelLiveryApiEvent(GetSinglelLiveryApiEvent event, emit) {}

  _deleteLiveryApiEvent(DeleteLiveryApiEvent event, emit) async {
    emit(
      state.copyWith(
        getAllLiveryRes: state.getAllLiveryRes.copyWith(
          status: ApiStatus.initial,
        ),
        deleteLiveryRes: ApiResponse(
          key: event.liveryId,
          status: ApiStatus.loading,
        ),
      ),
    );

    final response = await liverService.deleteLiveryServiceApi(event.liveryId);

    response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            deleteLiveryRes: ApiResponse(
              key: event.liveryId,
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            deleteLiveryRes: ApiResponse(
              key: event.liveryId,
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );

        List<LiveryModel> listData =
            state.getAllLiveryRes.apiData?.data?.toList() ?? [];

        int index = listData.indexWhere((v) => v.id == event.liveryId);

        if (index != -1) {
          listData.removeAt(index);

          emit(
            state.copyWith(
              getAllLiveryRes: state.getAllLiveryRes.copyWith(
                status: ApiStatus.success,
                apiData: state.getAllLiveryRes.apiData?.copyWith(
                  data: listData,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  _downloadLiveryApiEvent(DownloadLiveryApiEvent event, emit) async {
    emit(
      state.copyWith(
        downloadCountRes: ApiResponse(
          key: event.liveryId,
          status: ApiStatus.loading,
        ),
      ),
    );

    final response = await liverService.downloadCountServiceApi(event.liveryId);

    response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            downloadCountRes: ApiResponse(
              key: event.liveryId,
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        var liveryDataApi = state.getAllLiveryRes;
        var liveryData = liveryDataApi.apiData;
        var liveryList = liveryData?.data?.toList() ?? [];

        int? index = liveryList.indexWhere(
          (element) => element.id == event.liveryId,
        );

        if (index != 1) {
          liveryList[index] = liveryList[index].copyWith(
            downloadCount: success.downloadCount,
          );

          liveryData = liveryData?.copyWith(data: liveryList);
          liveryDataApi = liveryDataApi.copyWith(apiData: liveryData);
        }

        emit(
          state.copyWith(
            getAllLiveryRes: liveryDataApi,
            downloadCountRes: ApiResponse(
              key: event.liveryId,
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _getAllDownloadedLiveryApiEvent(
    GetAllDownloadedLiveryApiEvent event,
    emit,
  ) async {
    emit(
      state.copyWith(
        getLiveryDownloads: ApiResponse(status: ApiStatus.loading),
      ),
    );

    final response = await liverService.getAllDownloadLiveryApi();

    response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            getLiveryDownloads: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            getLiveryDownloads: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }
}
