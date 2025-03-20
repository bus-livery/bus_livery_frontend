part of 'livery_create_bloc.dart';

abstract class LiveryCreateEvent {}

class StoreBusModelEvent extends LiveryCreateEvent {
  final List<String> busModels;

  StoreBusModelEvent({required this.busModels});
}

class LiveryImageStore extends LiveryCreateEvent {
  final ImagePickerModel? image;

  LiveryImageStore({required this.image});
}

class LiveryAssignValuesEvent extends LiveryCreateEvent {
  final LiveryModel? data;

  LiveryAssignValuesEvent({required this.data});
}

// API EVENTS

class CreateLiveryApiEvent extends LiveryCreateEvent {
  final FormData data;
  final int? liveryId;
  final int? index;

  CreateLiveryApiEvent({required this.data, this.liveryId, this.index});
}

class GetBusTypeApiEvent extends LiveryCreateEvent {}
