import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery/widget/banner_ad_widget.dart';
import 'package:livery/features/livery/widget/livery_filter_app_bar.dart';
import 'package:livery/features/livery/widget/livery_grid_view.dart';
import 'package:livery/features/livery/widget/livery_list_view.dart';
import 'package:livery/features/livery/widget/livery_view_toggle_app_bar.dart';
import 'package:livery/features/livery/widget/upload_progress_indicator.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LiveryBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/buss_logo.png', height: 70),
        actions: [LiveryViewToggleAppBar(), LiveryFilterAppBar()],
      ),
      body: Padding(
        padding: AppSize.swPadding,
        child: Column(
          children: [
            // UPLOAD PROGRESS INDICATOR
            UploadProgressIndicator(),

            // Main content
            Expanded(
              child: BlocBuilder<LiveryBloc, LiveryState>(
                buildWhen:
                    (p, c) =>
                        p.getAllLiveryRes.status != c.getAllLiveryRes.status ||
                        p.gridColumns != c.gridColumns,
                builder: (context, state) {
                  customPrint('BLOC BUILDER - FeedScreen');
                  List<LiveryModel>? liveryData =
                      state.getAllLiveryRes.apiData?.data;
                  return WWResponseHandler(
                    data: state.getAllLiveryRes,
                    apiCall: () async {
                      context.read<LiveryBloc>().add(GetAllLiveryApiEvent());
                    },
                    isEmpty: liveryData?.isEmpty ?? true,
                    child:
                        state.gridColumns == 1
                            ? FeedListView(liveryData: liveryData, bloc: bloc)
                            : FeedGridView(liveryData: liveryData, bloc: bloc),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedGridView extends StatelessWidget {
  const FeedGridView({super.key, required this.liveryData, required this.bloc});

  final List<LiveryModel>? liveryData;
  final LiveryBloc bloc;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: liveryData?.length ?? 0,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        return LiveryGridView(
          index: index,
          bloc: bloc,
          data: liveryData![index],
        );
      },
    );
  }
}

class FeedListView extends StatelessWidget {
  const FeedListView({super.key, required this.liveryData, required this.bloc});

  final List<LiveryModel>? liveryData;
  final LiveryBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        if (index != 0) return AppSize.sizedBox1h;
        return BannerAdWidget();
      },
      itemCount: liveryData?.length ?? 0,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        return LiveryListView(
          index: index,
          bloc: bloc,
          data: liveryData![index],
        );
      },
    );
  }
}
