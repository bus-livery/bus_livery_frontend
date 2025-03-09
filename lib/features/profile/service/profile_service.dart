import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/utils/end_point.dart';

abstract class IProfileService {
  Future<Either<String, ProfileModel>> getMyProfileApi();
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
        (r) async => Right(ProfileModel.fromJson(r as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }
}
