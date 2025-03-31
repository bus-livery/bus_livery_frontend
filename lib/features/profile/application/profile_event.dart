part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileGetMyApiEvent extends ProfileEvent {}

class ProfileGetOtherApiEvent extends ProfileEvent {
  final int userId;

  ProfileGetOtherApiEvent({required this.userId});
}

class UpdateMyProfileEvent extends ProfileEvent {
  final ProfileModel data;

  UpdateMyProfileEvent({required this.data});
}

class GetMyLiveryApiEvent extends ProfileEvent {}

class GetOthersLiveryApiEvent extends ProfileEvent {
  final int userId;

  GetOthersLiveryApiEvent({required this.userId});
}

class LikeProfileApiEvent extends ProfileEvent {
  final int userId;

  LikeProfileApiEvent({required this.userId});
}
