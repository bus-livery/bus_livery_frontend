import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cfeature/report/application/report_bloc.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
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
        child:
            BlocSelector<ReportBloc, ReportState, ApiResponse<List<dynamic>>?>(
              selector: (state) => state.getReportReasonsRes,
              builder: (context, data) {
                customPrint('WwReportContent', name: 'BLOC BUILDER');
                return WWResponseHandler(
                  data: context.read<ReportBloc>().state.getReportReasonsRes,
                  apiCall: () async {
                    context.read<ReportBloc>().add(GetReportReasonsApiEvent());
                  },
                  isEmpty: data?.apiData?.isEmpty,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 4,
                    ),
                    itemCount: data?.apiData?.length ?? 0,
                    itemBuilder: (context, index) {
                      var reasons = data?.apiData![index];
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
