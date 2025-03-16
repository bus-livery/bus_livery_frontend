import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery_create/model/bus_type_model/bus_type_model.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/utils/end_point.dart';

abstract class ILiveryCreateService {
  Future<Either<String, LiveryModel>> createLiveryServiceApi({
    required FormData data,
  });

  Future<Either<String, LiveryModel>> updateLiveryServiceApi(LiveryModel data);

  Future<Either<String, List<BusTypeModel>>> getBusTypesServiceApi();
}

@LazySingleton(as: ILiveryCreateService)
class LiveryCreateService implements ILiveryCreateService {
  final DioService _dioServices;
  LiveryCreateService(this._dioServices);
  //
  @override
  Future<Either<String, LiveryModel>> createLiveryServiceApi({
    required FormData data,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.livery.createLivery,
        method: Method.post,
        formData: data,
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async =>
            Right(LiveryModel.fromJson(r.data as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, LiveryModel>> updateLiveryServiceApi(
    LiveryModel data,
  ) async {
    try {
      final res = await _dioServices.request(
        EndPoints.livery.updateLivery,
        method: Method.patch,
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async =>
            Right(LiveryModel.fromJson(r.data as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<BusTypeModel>>> getBusTypesServiceApi() async {
    try {
      final res = await _dioServices.request(
        EndPoints.busTypes.getBusTypes,
        method: Method.get,
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(
          (r.data as List)
              .map((e) => BusTypeModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } catch (e) {
      return Left("$e");
    }
  }
}
