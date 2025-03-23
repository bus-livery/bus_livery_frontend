import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livery/Cmodel/enum.dart';

part 'api_response.freezed.dart';

@Freezed()
class ApiResponse<T> with _$ApiResponse<T> {
  factory ApiResponse({
    dynamic key,
    T? apiData,
    String? errorMessage,
    String? successMessage,
    @Default(ApiStatus.initial) ApiStatus status,
    @Default(false) bool paginationLoading,
  }) = _ApiResponse<T>;
}
