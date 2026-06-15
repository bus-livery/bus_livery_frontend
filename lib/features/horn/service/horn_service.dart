import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/features/horn/model/horn_data_model.dart';
import 'package:livery/features/horn/model/horn_model.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/utils/end_point.dart';

abstract class IHornService {
  Future<Either<String, HornDataModel>> getAllHornsServiceApi({
    int? pageCount,
  });

  Future<Either<String, List<HornModel>>> getMyHornsServiceApi();

  Future<Either<String, List<HornModel>>> getOthersHornsServiceApi({
    required int userId,
  });

  Future<Either<String, HornModel>> createHornServiceApi(FormData data);

  Future<Either<String, void>> incrementHornDownloadCountApi({
    required int hornId,
  });
}

@LazySingleton(as: IHornService)
class HornService implements IHornService {
  final DioService _dioServices;

  HornService(this._dioServices);

  @override
  Future<Either<String, HornDataModel>> getAllHornsServiceApi({
    int? pageCount,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.horn.getAllHorns,
        method: Method.get,
        queryParam: {
          "approval_status": "approved",
          "page": pageCount ?? 1,
          "limit": 10,
        },
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async =>
            Right(HornDataModel.fromJson(r.data as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<HornModel>>> getMyHornsServiceApi() async {
    try {
      final res = await _dioServices.request(
        EndPoints.horn.getMyHorns,
        method: Method.get,
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(
          (r.data as List)
              .map((e) => HornModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<HornModel>>> getOthersHornsServiceApi({
    required int userId,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.horn.getOthersHorns,
        method: Method.get,
        queryParam: {"user_id": userId},
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(
          (r.data as List)
              .map((e) => HornModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, HornModel>> createHornServiceApi(FormData data) async {
    try {
      final res = await _dioServices.request(
        EndPoints.horn.createHorn,
        method: Method.post,
        formData: data,
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(HornModel.fromJson(r.data as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, void>> incrementHornDownloadCountApi({
    required int hornId,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.horn.downloadCount,
        method: Method.patch,
        queryParam: {'id': hornId},
      );
      return res.fold(
        (l) => Left(l.message),
        (r) => const Right(null),
      );
    } catch (e) {
      return Left("$e");
    }
  }
}
