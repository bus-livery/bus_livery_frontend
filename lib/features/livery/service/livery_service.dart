import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/features/livery/model/download_count_model/download_count_model.dart';
import 'package:livery/features/livery/model/livery_model/livery_data_model.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/utils/end_point.dart';

abstract class ILiveryService {
  Future<Either<String, LiveryDateModel>> getAllLiveryServiceApi({
    bool? downloads,
  });

  Future<Either<String, List<LiveryModel>>> getAllDownloadLiveryApi();

  Future<Either<String, String>> deleteLiveryServiceApi(int liveryId);

  Future<Either<String, DownloadCountModel>> downloadCountServiceApi(
    int? liveryId,
  );
}

@LazySingleton(as: ILiveryService)
class LiveryService implements ILiveryService {
  final DioService _dioServices;

  LiveryService(this._dioServices);

  @override
  Future<Either<String, LiveryDateModel>> getAllLiveryServiceApi({
    bool? downloads,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.livery.getAllLivery,
        method: Method.get,
        queryParam: {
          "approval_status": "approved",
          "most_downloaded": downloads ?? false,
        },
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async =>
            Right(LiveryDateModel.fromJson(r.data as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }

  @override
  Future<Either<String, List<LiveryModel>>> getAllDownloadLiveryApi() async {
    try {
      final res = await _dioServices.request(
        EndPoints.livery.getDownloadedLivery,
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
  Future<Either<String, String>> deleteLiveryServiceApi(int liveryId) async {
    try {
      final res = await _dioServices.request(
        EndPoints.livery.deleteLivery,
        method: Method.delete,
        queryParam: {'livery_id': liveryId},
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
  Future<Either<String, DownloadCountModel>> downloadCountServiceApi(
    int? liveryId,
  ) async {
    try {
      final res = await _dioServices.request(
        EndPoints.livery.downloadCount,
        method: Method.patch,
        queryParam: {'id': liveryId},
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async =>
            Right(DownloadCountModel.fromJson(r.data as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left("$e");
    }
  }
}
