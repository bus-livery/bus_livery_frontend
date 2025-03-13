part of 'livery_bloc.dart';

abstract class LiveryEvent {}

class GetAllLiveryApiEvent extends LiveryEvent {}

class GetMyLiveryApiEvent extends LiveryEvent {}

class GetOthersLiveryApiEvent extends LiveryEvent {}

class GetSinglelLiveryApiEvent extends LiveryEvent {}

class UpdateLiveryApiEvent extends LiveryEvent {}

class DeleteLiveryApiEvent extends LiveryEvent {}

class DownloadLiveryApiEvent extends LiveryEvent {}

class GetAllDownloadedLiveryApiEvent extends LiveryEvent {}

class GetBusTypeApiEvent extends LiveryEvent {}
