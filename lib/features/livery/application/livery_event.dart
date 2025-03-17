part of 'livery_bloc.dart';

abstract class LiveryEvent {}

// API EVENTS

class GetAllLiveryApiEvent extends LiveryEvent {}

class GetMyLiveryApiEvent extends LiveryEvent {}

class GetOthersLiveryApiEvent extends LiveryEvent {}

class GetSinglelLiveryApiEvent extends LiveryEvent {}

class UpdateLiveryApiEvent extends LiveryEvent {}

class DeleteLiveryApiEvent extends LiveryEvent {
  final int liveryId;

  DeleteLiveryApiEvent({required this.liveryId});
}

class DownloadLiveryApiEvent extends LiveryEvent {}

class GetAllDownloadedLiveryApiEvent extends LiveryEvent {}
