import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/livery/model/livery_model/livery_data_model.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery/service/livery_service.dart';
import 'package:livery/utils/bloc_life_cycle.dart';
import 'package:livery/utils/custom_print.dart';

part 'livery_event.dart';
part 'livery_state.dart';

@injectable
class LiveryBloc extends Bloc<LiveryEvent, LiveryState> with BlocLifeCycle {
  final ILiveryService liverService;
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

  LiveryBloc(this.liverService) : super(LiveryState.initial()) {
    //
    initstate();
    //

    // API EVENTS
    on<LiveryEvent>((event, emit) {});

    on<GetAllLiveryApiEvent>(_getAllLiveryApiEvent);

    on<GetMyLiveryApiEvent>(_getMyLiveryApiEvent);

    on<GetOthersLiveryApiEvent>(_getOthersLiveryApiEvent);

    on<GetSinglelLiveryApiEvent>(_getSinglelLiveryApiEvent);

    on<UpdateLiveryApiEvent>(_updateSingleLiveryApiEvent);

    on<DeleteLiveryApiEvent>(_deleteLiveryApiEvent);

    on<DownloadLiveryApiEvent>(_downloadLiveryApiEvent);

    on<GetAllDownloadedLiveryApiEvent>(_getAllDownloadedLiveryApiEvent);
  }

  // API EVENT

  _getAllLiveryApiEvent(GetAllLiveryApiEvent event, emit) async {
    emit(
      state.copyWith(getAllLiveryRes: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await liverService.getAllLiveryServiceApi();

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

  _getMyLiveryApiEvent(GetMyLiveryApiEvent event, emit) {}

  _getOthersLiveryApiEvent(GetOthersLiveryApiEvent event, emit) {}

  _getSinglelLiveryApiEvent(GetSinglelLiveryApiEvent event, emit) {}

  _updateSingleLiveryApiEvent(UpdateLiveryApiEvent event, emiy) {}

  _deleteLiveryApiEvent(DeleteLiveryApiEvent event, emit) {}

  _downloadLiveryApiEvent(DownloadLiveryApiEvent event, emiy) {}

  _getAllDownloadedLiveryApiEvent(GetAllDownloadedLiveryApiEvent event, emit) {}
}
