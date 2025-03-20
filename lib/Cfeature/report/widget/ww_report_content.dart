import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cfeature/report/application/report_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/styles.dart';

class WwReportContent extends StatelessWidget {
  final int? contentId;
  const WwReportContent({super.key, required this.contentId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<ReportBloc, ReportState>(
          listener: (context, state) {
            customPrint('jithin');
            var report = state.reportContentRes;
            customPrint('jithin : ${report.status}');

            if (report.status == ApiStatus.failure) {
              customPrint('jithin 2 ');
              wwDialogueBox(context, textSub: report.errorMessage);
            }

            if (report.status == ApiStatus.success) {
              showSuccessToast(message: report.apiData);
            }
          },
          builder: (context, state) {
            return WWResponseHandler(
              data: state.getReportReasonsRes,
              apiCall: () async {
                context.read<ReportBloc>().add(GetReportReasonsApiEvent());
              },
              isEmpty: state.getReportReasonsRes.apiData?.isEmpty,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 4,
                ),
                itemCount: state.getReportReasonsRes.apiData?.length ?? 0,
                itemBuilder: (context, index) {
                  var reasons = state.getReportReasonsRes.apiData![index];
                  return reportDecoration(context, reasons);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  InkWell reportDecoration(BuildContext context, String text) {
    return InkWell(
      onTap: () {
        context.router.maybePop();
        context.read<ReportBloc>().add(
          ReportContentApiEvent(
            reportType: ReportType.livery,
            id: contentId,
            reason: text,
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary),
          // color: AppColors.primary,
        ),
        child: Center(child: Text(text, style: normalText(context))),
      ),
    );
  }
}
