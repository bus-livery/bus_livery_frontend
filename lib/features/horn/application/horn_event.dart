part of 'horn_bloc.dart';

abstract class HornEvent {}

class FetchAllHornsApiEvent extends HornEvent {
  final int? pageCount;

  FetchAllHornsApiEvent({this.pageCount});
}

class FetchMyHornsApiEvent extends HornEvent {}

class FetchOthersHornsApiEvent extends HornEvent {
  final int userId;

  FetchOthersHornsApiEvent({required this.userId});
}

class CreateHornApiEvent extends HornEvent {
  final FormData data;

  CreateHornApiEvent({required this.data});
}

class DownloadHornEvent extends HornEvent {
  final HornModel horn;

  DownloadHornEvent({required this.horn});
}
