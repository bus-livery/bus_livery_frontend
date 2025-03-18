import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/service/dio_service.dart';
import 'package:livery/utils/end_point.dart';

abstract class IReportService {
  Future<Either<String, List<dynamic>>> getReportReasons();

  Future<Either<String, String>> reportContent({
    required Map<String, dynamic> data,
  });
}

@LazySingleton(as: IReportService)
class ReportService implements IReportService {
  final DioService _dioServices;

  ReportService(this._dioServices);

  @override
  Future<Either<String, String>> reportContent({
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await _dioServices.request(
        EndPoints.report.reportContent,
        method: Method.post,
        queryParam: data,
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
  Future<Either<String, List<dynamic>>> getReportReasons() async {
    try {
      final res = await _dioServices.request(
        EndPoints.report.getReportReasons,
        method: Method.get,
      );
      return res.fold(
        (l) => Left(l.message),
        (r) async => Right(r.data['reasons']),
      );
    } catch (e) {
      return Left("$e");
    }
  }
}
