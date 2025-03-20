import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:livery/Cfeature/report/service/report_service.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/utils/bloc_life_cycle.dart';
import 'package:livery/utils/custom_print.dart';

part 'report_event.dart';
part 'report_state.dart';

enum ReportType { livery, profile }

@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> with BlocLifeCycle {
  final IReportService service;

  @override
  void initstate() {
    customPrint('REPORT BLOC INITIALIZED');

    WidgetsBinding.instance.addPostFrameCallback(
      (v) => add(GetReportReasonsApiEvent()),
    );
  }

  @override
  Future<void> close() {
    customPrint('REPORT BLOC CLOSED');
    return super.close();
  }

  ReportBloc(this.service) : super(ReportState.initial()) {
    initstate();
    //
    on<ReportContentApiEvent>(_reportContentApiEvent);

    on<GetReportReasonsApiEvent>(_getReportReasonsApiEvent);
  }

  _getReportReasonsApiEvent(GetReportReasonsApiEvent event, emit) async {
    emit(
      state.copyWith(
        getReportReasonsRes: ApiResponse(status: ApiStatus.loading),
      ),
    );

    final response = await service.getReportReasons();

    response.fold(
      //
      (failure) {
        emit(
          state.copyWith(
            getReportReasonsRes: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            getReportReasonsRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }

  _reportContentApiEvent(ReportContentApiEvent event, emit) async {
    emit(
      state.copyWith(reportContentRes: ApiResponse(status: ApiStatus.loading)),
    );

    final response = await service.reportContent(
      data: {
        "reason": event.reason,
        "reported_id": event.id,
        "type": event.reportType?.name,
      },
    );

    response.fold(
      //
      (failure) {
        customPrint(failure, name: 'failure');
        emit(
          state.copyWith(
            reportContentRes: ApiResponse(
              status: ApiStatus.failure,
              errorMessage: failure,
            ),
          ),
        );
      },
      //
      (success) {
        emit(
          state.copyWith(
            reportContentRes: ApiResponse(
              status: ApiStatus.success,
              apiData: success,
            ),
          ),
        );
      },
    );
  }
}
