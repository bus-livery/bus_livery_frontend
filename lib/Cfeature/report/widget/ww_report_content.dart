import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cfeature/report/application/report_bloc.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/styles.dart';

class WwReportContent extends StatelessWidget {
  final BuildContext ctx;
  final int? contentId;
  final ReportType type;
  const WwReportContent(
    this.ctx, {
    super.key,
    required this.contentId,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          children: [
            WwText(text: 'Report', style: normalText()),
            BlocSelector<ReportBloc, ReportState, ApiResponse<List<dynamic>>?>(
              selector: (state) => state.getReportReasonsRes,
              builder: (context, data) {
                customPrint('WwReportContent', name: 'BLOC BUILDER');
                return BlocListener<ReportBloc, ReportState>(
                  listenWhen: (p, c) {
                    return p.reportContentRes.status !=
                            c.reportContentRes.status &&
                        c.reportContentRes.key == contentId;
                  },
                  listener: (context, state) {
                    customPrint('listener : ${state.reportContentRes.status}');
                    if (state.reportContentRes.status == ApiStatus.failure) {
                      wwDialogueBox(
                        context,
                        textSub: state.reportContentRes.errorMessage,
                      );
                    }

                    if (state.reportContentRes.status == ApiStatus.success) {
                      showSuccessToast(
                        message: state.reportContentRes.successMessage,
                      );
                    }
                  },
                  child: WWResponseHandler(
                    data: context.read<ReportBloc>().state.getReportReasonsRes,
                    apiCall: () async {
                      context.read<ReportBloc>().add(
                        GetReportReasonsApiEvent(),
                      );
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
                        return reportDecoration(ctx, reasons);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
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
            context: context,
            reportType: type,
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
        child: Center(child: Text(text, style: normalText())),
      ),
    );
  }
}
