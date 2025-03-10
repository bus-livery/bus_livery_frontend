import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/di/injection.dart';

enum Method { get, post, put, delete }

@LazySingleton()
class DioService {
  final Dio dio;

  SharedPrefService sharedPS = getIt<SharedPrefService>();

  DioService() : dio = Dio(BaseOptions(baseUrl: "http://localhost:8080/api")) {
    dio.interceptors.add(DioInterceptor());
  }

  Future<Either<CustomDioException, Response>> request(
    String endpoint, {
    required Method method,
    bool apiCaching = false,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParam,
    dynamic formData,
  }) async {
    try {
      Response? response;

      // API CACHING
      if (apiCaching) {
        if (sharedPS.getCachedApiData(key: endpoint) != null) {
          customPrint('API_CACHING');
          customPrint(endpoint, name: "Endpoint");
          customPrint(data, name: "Payload");
          var decode = jsonDecode(sharedPS.getCachedApiData(key: endpoint)!);
          return Right(
            Response(data: decode, requestOptions: RequestOptions()),
          );
        }
      }

      switch (method) {
        case Method.post:
          response = await dio.post(
            endpoint,
            data: data ?? formData,
            queryParameters: queryParam,
          );
          break;
        case Method.get:
          response = await dio.get(
            endpoint,
            queryParameters: data ?? queryParam,
          );
          break;
        case Method.put:
          response = await dio.put(endpoint, data: data ?? formData);
          break;
        case Method.delete:
          response = await dio.delete(
            endpoint,
            data: data ?? formData,
            queryParameters: queryParam,
          );
          break;
      }

      if (apiCaching) {
        sharedPS.cacheApiData(key: endpoint, value: jsonEncode(response.data));
      }
      // Returns data with success response
      return Right(response);
      //
    } on DioException catch (e) {
      String? errorMsg;
      try {
        errorMsg = e.response?.data?['app_data'];
      } catch (e) {
        // exception //
      }
      return Left(
        CustomDioException(
          message: errorMsg ?? returnDioErrorMessage(e),
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      log(e.toString(), name: "Dio error");
      return Left(CustomDioException(message: "Oops!\nSomething went wrong"));
    }
  }
}

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token = getIt<SharedPrefService>().getString("token");

    // Determine content type based on data type
    final isFormData = options.data is FormData;
    final contentType = isFormData ? 'multipart/form-data' : 'application/json';

    options.headers.addAll({
      "Content-Type": contentType,
      "accept": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    });

    // Log request details
    if (isFormData) {
      // For FormData, log file details
      final formData = options.data as FormData;
      log('Uploading ${formData.files.length} files', name: 'Multipart Upload');
    } else {
      log(jsonEncode(options.data), name: "Post data");
      log("${options.uri}", name: "req uri");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    log("${response.statusCode}", name: "statusCode");
    log(jsonEncode(response.data), name: "Response.data");
    log("= = = = = = = = = = = = = = = = = = = = = = = = = = = =");

    SharedPrefService sharedPS = getIt<SharedPrefService>();
    if (response.data != null && response.data['token'] != null) {
      await sharedPS.saveString('token', response.data['token'] ?? '');
    }
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    customPrint("${err.requestOptions.uri}", name: "Endpoint");
    customPrint(
      "${err.response?.statusCode} ${err.response?.data}",
      name: "DioException.Error",
    );

    log(
      "Network issue detected. Retrying with a 1-second delay...",
      name: "Retry",
    );

    // Adding a 1-second delay
    await Future.delayed(Duration(seconds: 1));

    if (err.response?.statusCode == 401) {
      // getIt<AppRouter>().pushNamed(RouteMobileNames.loginScreen);
      // getIt<SharedPrefService>().remove("token");
    }
    super.onError(err, handler);
  }
}

class CustomDioException implements Exception {
  final String message;
  final int? statusCode;

  CustomDioException({required this.message, this.statusCode});

  @override
  String toString() =>
      'CustomDioException: $message (Status code: $statusCode)';
}

String returnDioErrorMessage(DioException e) {
  String message = "Something went wrong";
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      message =
          "The operation has timed out. Please check your internet connection and try again.";
      break;
    case DioExceptionType.sendTimeout:
      message =
          "The operation has timed out. Please check your internet connection and try again.";
      break;

    case DioExceptionType.receiveTimeout:
      message =
          "The operation has timed out. Please check your internet connection and try again.";
      break;

    case DioExceptionType.badCertificate:
      message = "Oops!\nSomething went wrong";
      break;

    case DioExceptionType.badResponse:
      // Handling server failures here
      if (e.response != null && e.response?.statusCode != null) {
        if (kReleaseMode) {
          message =
              '''We're experiencing some technical difficulties at the moment. Please try again shortly, and if the issue continues, feel free to reach out to our support team for assistance. We appreciate your patience!''';
        } else {
          message =
              "Server error: ${e.response?.statusCode} ${e.response?.statusMessage}";
        }
      } else {
        message = "Server responded with an unexpected error.";
      }
      break;

    case DioExceptionType.cancel:
      message = "Something went wrong cancel";
      break;

    case DioExceptionType.connectionError:
      message =
          '''We're sorry, but it seems there's a problem with your network connection. Please check your internet connection and try again.''';
      break;

    case DioExceptionType.unknown:
      message = "Something went wrong : $e";
      break;
  }
  return message;
}
