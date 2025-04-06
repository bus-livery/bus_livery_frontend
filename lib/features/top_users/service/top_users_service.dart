import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/utils/end_point.dart';

abstract class ITopUsersService {
  Future<Either<String, List<ProfileModel>>> fetchTopUsers();
}

@LazySingleton(as: ITopUsersService)
class TopUsersService implements ITopUsersService {
  final DioService _dioService;

  TopUsersService(this._dioService);

  @override
  Future<Either<String, List<ProfileModel>>> fetchTopUsers() async {
    try {
      final res = await _dioService.request(
        EndPoints.profile.topLiked,
        method: Method.get,
      );
      return res.fold((l) => Left(l.message), (r) {
        final users =
            (r.data as List)
                .map((json) => ProfileModel.fromJson(json))
                .toList();
        return Right(users);
      });
    } catch (e) {
      return Left("$e");
    }
  }
}
