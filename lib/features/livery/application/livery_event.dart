part of 'livery_bloc.dart';

abstract class LiveryEvent {}

class InsetNewLiveryEvent extends LiveryEvent {
  final LiveryModel newData;

  InsetNewLiveryEvent({required this.newData});
}

// API EVENTS

class GetAllLiveryApiEvent extends LiveryEvent {}

class GetSinglelLiveryApiEvent extends LiveryEvent {}

class DeleteLiveryApiEvent extends LiveryEvent {
  final int liveryId;

  DeleteLiveryApiEvent({required this.liveryId});
}

class DownloadLiveryApiEvent extends LiveryEvent {
  final int? liveryId;

  DownloadLiveryApiEvent({required this.liveryId});
}

class GetAllDownloadedLiveryApiEvent extends LiveryEvent {}
