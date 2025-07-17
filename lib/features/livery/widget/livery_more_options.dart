import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cfeature/report/application/report_bloc.dart';
import 'package:livery/Cfeature/report/widget/ww_report_content.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/router/router.gr.dart';

class LiveryMoreOptions extends StatelessWidget {
  final LiveryBloc bloc;
  final LiveryModel data;
  const LiveryMoreOptions({super.key, required this.bloc, required this.data});

  @override
  Widget build(BuildContext context) {
    // LOADING WIDGET ADDED WHEN DELETING LIVERY

    return BlocConsumer<LiveryBloc, LiveryState>(
      buildWhen: (p, c) {
        return p.deleteLiveryRes.status != c.deleteLiveryRes.status &&
            c.deleteLiveryRes.key == data.id;
      },
      listenWhen: (p, c) {
        return p.deleteLiveryRes.status != c.deleteLiveryRes.status &&
            c.deleteLiveryRes.key == data.id;
      },
      listener: (context, state) {
        if (state.deleteLiveryRes.status == ApiStatus.failure) {
          wwDialogueBox(context, textSub: state.deleteLiveryRes.errorMessage);
        }

        if (state.deleteLiveryRes.status == ApiStatus.success) {
          showSuccessToast(message: state.deleteLiveryRes.successMessage);
        }
      },
      builder: (context, deleteStatus) {
        customPrint('LIVERY BLOC BUILDER - _MoreOptons');
        return deleteStatus.deleteLiveryRes.status == ApiStatus.loading
            ? CupertinoActivityIndicator()
            : _MoreOptionWidget(data);
      },
    );
  }
}

class _MoreOptionWidget extends StatelessWidget {
  final LiveryModel data;
  const _MoreOptionWidget(this.data);

  @override
  Widget build(BuildContext context) {
    final liveryBloc = context.read<LiveryBloc>();

    showBottomSheet(BuildContext context, LiveryModel data) {
      return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext _) {
          return WwReportContent(
            context,
            contentId: data.id,
            type: ReportType.livery,
          );
        },
      );
    }

    return IconButton(
      icon: const Icon(Icons.more_horiz, color: AppColors.primary),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AppSize.sizedBox3h,
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: WwText(text: 'Edit Livery'),
                    onTap: () {
                      context.router.push(LiveryCreateRoute(data: data));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.report),
                    title: WwText(text: 'Report Livery'),
                    onTap: () {
                      showBottomSheet(context, data);
                      // context.router.maybePop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: WwText(text: 'Delete Livery'),
                    onTap: () {
                      context.router.maybePop();
                      liveryBloc.add(DeleteLiveryApiEvent(liveryId: data.id!));
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
