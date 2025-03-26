part of 'report_bloc.dart';

abstract class ReportEvent {}

// API EVENTS

class GetReportReasonsApiEvent extends ReportEvent {}

class ReportContentApiEvent extends ReportEvent {
  final BuildContext context;
  final ReportType? reportType;
  final int? id;
  final String? reason;

  ReportContentApiEvent({
    required this.context,
    required this.reportType,
    required this.id,
    required this.reason,
  });
}
