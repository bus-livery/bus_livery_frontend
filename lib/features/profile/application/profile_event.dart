part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileGetMyApiEvent extends ProfileEvent {}

class UpdateMyProfileEvent extends ProfileEvent {
  final ProfileModel data;

  UpdateMyProfileEvent({required this.data});
}
