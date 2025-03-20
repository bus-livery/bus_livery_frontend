import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cmodel/image_picker_model/image_picker_model.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery_create/model/bus_type_model/bus_type_model.dart';
import 'package:livery/features/livery_create/model/livery_req_model/livery_req_model.dart';
import 'package:livery/features/livery_create/service/livery_create_service.dart';
import 'package:livery/utils/bloc_life_cycle.dart';
import 'package:livery/utils/custom_print.dart';

part 'livery_create_event.dart';
part 'livery_create_state.dart';

@injectable
class LiveryCreateBloc extends Bloc<LiveryCreateEvent, LiveryCreateState>
    with BlocLifeCycle {
  final ILiveryCreateService liverCreateService;

  final liveryName = TextEditingController();
  int? liveryId;
  String busType = '';
  String busModel = '';
  final description = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initstate() {
    customPrint('LIVERY CREATE BLOC INITIALIZED');
  }

  @override
  Future<void> close() {
    customPrint('LIVERY CREATE BLOC CLOSED');
    liveryName.dispose();
    description.dispose();
    return super.close();
  }

  LiveryCreateBloc(this.liverCreateService)
    : super(LiveryCreateState.initial()) {
    //

    initstate();
    //

    on<LiveryCreateEvent>((event, emit) {});

    on<CreateLiveryApiEvent>(_createLiveryApiEvent);

    on<StoreBusModelEvent>(_storeBusModelEvent);

    on<LiveryImageStore>(_liveryCreateStore);

    on<LiveryAssignValuesEvent>(_liveryAssignValuesEvent);

    // API EVENT

    on<GetBusTypeApiEvent>(_getBusTypeApiEvent);
  }

  void _liveryAssignValuesEvent(LiveryAssignValuesEvent event, emit) {
    liveryId = event.data?.id;
    liveryName.text = event.data?.liveryName ?? '';
    busModel = event.data?.busModel ?? '';
    busType = event.data?.busType ?? '';
    description.text = event.data?.description ?? '';
  }

  //

  _storeBusModelEvent(StoreBusModelEvent event, emit) {
    emit(state.copyWith(busModels: event.busModels));
  }

  _liveryCreateStore(LiveryImageStore event, emit) {
    emit(state.copyWith(storeImage: event.image));
  }

  // API

  _createLiveryApiEvent(CreateLiveryApiEvent event, emit) async {
    emit(
      state.copyWith(liveryCreateRes: ApiResponse(status: ApiStatus.loading)),
    );

    late Either<String, LiveryModel> response;
    if (event.liveryId != null) {
      response = await liverCreateService.updateLiveryServiceApi(
        data: event.data,
      );
    } else {
      response = await liverCreateService.createLiveryServiceApi(
        data: event.data,
      );
    }

    response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            liveryCreateRes: ApiResponse(
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
            liveryCreateRes: ApiResponse(status: ApiStatus.success),
          ),
        );
      },
    );
  }

  _getBusTypeApiEvent(GetBusTypeApiEvent event, emit) async {
    emit(state.copyWith(busTypesRes: ApiResponse(status: ApiStatus.loading)));

    final response = await liverCreateService.getBusTypesServiceApi();

    response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            busTypesRes: ApiResponse(
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
            busTypesRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }
}
