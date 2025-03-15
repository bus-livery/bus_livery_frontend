part of 'livery_create_bloc.dart';

abstract class LiveryCreateEvent {}

class StoreBusModelEvent extends LiveryCreateEvent {
  final List<String> busModels;

  StoreBusModelEvent({required this.busModels});
}

class LiveryCreateStore extends LiveryCreateEvent {
  final ImagePickerModel? image;

  LiveryCreateStore({required this.image});
}

// API EVENTS

class CreateLiveryApiEvent extends LiveryCreateEvent {
  final LiveryReqModel data;

  CreateLiveryApiEvent({required this.data});
}

class GetBusTypeApiEvent extends LiveryCreateEvent {}
