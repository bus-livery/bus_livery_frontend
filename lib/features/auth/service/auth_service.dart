import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/end_point.dart';

class LoginResModel {
  final String? message;
  final int? statusCode;

  LoginResModel({this.message, this.statusCode});
}

abstract class IAuthService {
  Future<Either<String, String>> otpGenerate({required String phone});

  Future<Either<String, LoginResModel>> loginOtpApi({
    required String email,
    required String otp,
  });

  Future<Either<String, String>> userRegisterOtpApi({required String phone});
}

@LazySingleton(as: IAuthService)
class AuthService implements IAuthService {
  final DioService _dioServices;
  final SharedPrefService sharedPrefService;

  AuthService(this._dioServices, this.sharedPrefService);

  @override
  Future<Either<String, String>> otpGenerate({required String phone}) async {
    try {
      final res = await _dioServices.request(
        EndPoints.auth.otpRegister,
        method: Method.post,
        data: {"phone": phone},
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(r.data['message']),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, LoginResModel>> loginOtpApi({
    required String email,
    required String otp,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.auth.loginOtp,
        method: Method.post,
        data: {"phone": email, "otp": otp},
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(
          LoginResModel(message: r.data['message'], statusCode: r.statusCode),
        ),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, String>> userRegisterOtpApi({
    required String phone,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.auth.createUser,
        method: Method.post,
        data: {"phone": phone},
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(r.data['message']),
      );
    } catch (e) {
      return Left("$e");
    }
  }
}
