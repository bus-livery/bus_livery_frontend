import 'package:bloc/bloc.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/features/livery/livery_model/livery_data_model.dart';
import 'package:livery/features/livery/livery_model/livery_model.dart';

part 'livery_event.dart';
part 'livery_state.dart';

class LiveryBloc extends Bloc<LiveryEvent, LiveryState> {
  LiveryBloc() : super(LiveryState.initial()) {
    on<LiveryEvent>((event, emit) {});
  }
}
