part of 'livery_bloc.dart';

abstract class LiveryEvent {}

class InsetNewLiveryEvent extends LiveryEvent {
  final LiveryModel newData;

  InsetNewLiveryEvent({required this.newData});
}

class FilterLiveryEvent extends LiveryEvent {
  final LiveryFilter filter;

  FilterLiveryEvent({required this.filter});
}
// API EVENTS

class GetAllLiveryApiEvent extends LiveryEvent {
  final bool? mostDownload;

  GetAllLiveryApiEvent({this.mostDownload});
}

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
