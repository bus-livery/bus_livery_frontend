part of 'livery_bloc.dart';

abstract class LiveryEvent {}

class GetAllLiveryApiEvent extends LiveryEvent {}

class GetSinglelLiveryApiEvent extends LiveryEvent {}

class UpdateSingleLiveryApiEvent extends LiveryEvent {}

class DownloadLiveryApiEvent extends LiveryEvent {}
