import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cwidgets/ww_app_bar.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery/view/feed_screen.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';

@RoutePage()
class LiveryDownloadsScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const LiveryDownloadsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext ctr) {
    return BlocProvider.value(
      value: BlocProvider.of<LiveryBloc>(ctr)
        ..add(GetAllDownloadedLiveryApiEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WwAppBar(title: 'Downloads'),
      body: Padding(
        padding: AppSize.swPadding,
        child: BlocBuilder<LiveryBloc, LiveryState>(
          buildWhen:
              (p, c) =>
                  p.getLiveryDownloads.status != c.getLiveryDownloads.status,
          builder: (context, state) {
            customPrint('BLOC BUILDER - Downloads');
            List<LiveryModel> liveryData =
                state.getLiveryDownloads.apiData ?? [];
            final bloc = context.read<LiveryBloc>();

            return WWResponseHandler(
              data: state.getAllLiveryRes,
              apiCall: () async {
                context.read<LiveryBloc>().add(
                  GetAllDownloadedLiveryApiEvent(),
                );
              },
              isEmpty: liveryData.isEmpty,
              child: ListView.separated(
                separatorBuilder: (context, index) => AppSize.sizedBox1h,
                itemCount: liveryData.length,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return PostWidget(
                    index: index,
                    bloc: bloc,
                    data: liveryData[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
