import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/profile/model/profile_like_mode/profile_like_model.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/utils/end_point.dart';

abstract class IProfileService {
  Future<Either<String, ProfileModel>> getMyProfileApi();

  Future<Either<String, ProfileModel>> getOtherProfileApi({
    required int userId,
  });

  Future<Either<String, List<ProfileModel>>> getLikedProfilesApi();

  Future<Either<String, String>> updateMyProfileApi(ProfileModel data);

  Future<Either<String, List<LiveryModel>>> fetchMyLiveryApi();

  Future<Either<String, List<LiveryModel>>> fetchOthersLiveryApi({
    required int userId,
  });

  Future<Either<String, ProfileLikeModel>> likeProfileApi({
    required int userId,
  });
}

@LazySingleton(as: IProfileService)
class ProfileService implements IProfileService {
  final DioService _dioServices;

  ProfileService(this._dioServices);

  @override
  Future<Either<String, ProfileModel>> getMyProfileApi() async {
    try {
      final res = await _dioServices.request(
        EndPoints.profile.getMy,
        method: Method.get,
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async =>
            Right(ProfileModel.fromJson(r.data as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, ProfileModel>> getOtherProfileApi({
    required int userId,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.profile.getOther,
        method: Method.get,
        queryParam: {"user_id": userId},
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async =>
            Right(ProfileModel.fromJson(r.data as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<ProfileModel>>> getLikedProfilesApi() async {
    try {
      final res = await _dioServices.request(
        EndPoints.profile.getLikedProfiles,
        method: Method.get,
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(
          (r.data as List)
              .map((e) => ProfileModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, String>> updateMyProfileApi(ProfileModel data) async {
    try {
      final res = await _dioServices.request(
        EndPoints.profile.updateMy,
        method: Method.patch,
        data: data.toJson(),
      );
      return res.fold((l) => Left(l.message), (r) async => Right('Success'));
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<LiveryModel>>> fetchMyLiveryApi() async {
    try {
      final res = await _dioServices.request(
        EndPoints.livery.getMyLivery,
        method: Method.get,
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(
          (r.data as List)
              .map((e) => LiveryModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<LiveryModel>>> fetchOthersLiveryApi({
    required int userId,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.livery.getOthersLivery,
        method: Method.get,
        queryParam: {"user_id": userId},
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(
          (r.data as List)
              .map((e) => LiveryModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, ProfileLikeModel>> likeProfileApi({
    required int userId,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.profile.likeProfile,
        method: Method.post,
        data: {"liked_id": userId},
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async =>
            Right(ProfileLikeModel.fromJson(r.data as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }
}
