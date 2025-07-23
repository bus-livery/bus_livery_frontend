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

class ToggleGridViewEvent extends LiveryEvent {
  final int columns; // 1 for list view, 2 for grid view

  ToggleGridViewEvent({required this.columns});
}

class StartUploadEvent extends LiveryEvent {
  final String uploadId;

  StartUploadEvent({required this.uploadId});
}

class CompleteUploadEvent extends LiveryEvent {
  final String uploadId;

  CompleteUploadEvent({required this.uploadId});
}

// API EVENTS

class GetAllLiveryApiEvent extends LiveryEvent {
  final int? pageCount;
  final bool? mostDownload;

  GetAllLiveryApiEvent({this.pageCount, this.mostDownload});
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
