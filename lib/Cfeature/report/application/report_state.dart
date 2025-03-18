part of 'report_bloc.dart';

class ReportState {
  // API STATES
  final ApiResponse<List<dynamic>> getReportReasonsRes;
  // Bus Types
  final ApiResponse<String> reportContentRes;
  ReportState({
    // API STATES
    required this.getReportReasonsRes,
    required this.reportContentRes,
  });

  factory ReportState.initial() {
    return ReportState(
      // API STATES
      getReportReasonsRes: ApiResponse<List<dynamic>>(),
      reportContentRes: ApiResponse<String>(),
    );
  }

  ReportState copyWith({
    // API STATES
    ApiResponse<List<dynamic>>? getReportReasonsRes,
    ApiResponse<String>? reportContentRes,
  }) {
    return ReportState(
      // API STATES
      getReportReasonsRes: getReportReasonsRes ?? this.getReportReasonsRes,
      reportContentRes: reportContentRes ?? this.reportContentRes,
    );
  }
}
