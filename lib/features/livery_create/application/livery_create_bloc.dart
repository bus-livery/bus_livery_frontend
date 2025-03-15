import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/features/livery_create/model/bus_type_model/bus_type_model.dart';
import 'package:livery/features/livery_create/model/livery_req_model/livery_req_model.dart';
import 'package:livery/features/livery_create/service/livery_create_service.dart';
import 'package:livery/service/image_picker_service.dart';
import 'package:livery/utils/bloc_life_cycle.dart';
import 'package:livery/utils/custom_print.dart';

part 'livery_create_event.dart';
part 'livery_create_state.dart';

@injectable
class LiveryCreateBloc extends Bloc<LiveryCreateEvent, LiveryCreateState>
    with BlocLifeCycle {
  final ILiveryCreateService liverCreateService;

  @override
  void initstate() {
    customPrint('LIVERY CREATE BLOC INITIALIZED');
  }

  @override
  Future<void> close() {
    customPrint('LIVERY CREATE BLOC CLOSED');
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

    on<LiveryCreateStore>(_liveryCreateStore);

    // API EVENT

    on<GetBusTypeApiEvent>(_getBusTypeApiEvent);
  }

  //
  _storeBusModelEvent(StoreBusModelEvent event, emit) {
    emit(state.copyWith(busModels: event.busModels));
  }

  _liveryCreateStore(LiveryCreateStore event, emit) {
    emit(
      state.copyWith(
        liveryCreateRes: ApiResponse(
          apiData: state.liveryCreateRes.apiData?.copyWith(image: event.image),
        ),
      ),
    );
  }

  // API

  _createLiveryApiEvent(CreateLiveryApiEvent event, emit) async {}

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
