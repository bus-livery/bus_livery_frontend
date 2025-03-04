import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/end_point.dart';

abstract class IAuthService {
  Future<Either<String, String>> otpGenerate({required String email});
}

@LazySingleton(as: IAuthService)
class AuthService implements IAuthService {
  final DioService _dioServices;
  final SharedPrefService sharedPrefService;

  AuthService(this._dioServices, this.sharedPrefService);

  @override
  Future<Either<String, String>> otpGenerate({required String email}) async {
    try {
      final res = await _dioServices.request(
        EndPoints.auth.otpRegister,
        method: Method.post,
        data: {"emaill": email},
      );
      return res.fold((l) => Left(l.message), (response) async {
        return Right('success');
      });
    } catch (e) {
      return Left("$e");
    }
  }
}
