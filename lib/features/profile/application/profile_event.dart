part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileGetMyApiEvent extends ProfileEvent {}

class ProfileUpdateMyApiEvent extends ProfileEvent {
  final ProfileModel data;

  ProfileUpdateMyApiEvent({required this.data});
}
