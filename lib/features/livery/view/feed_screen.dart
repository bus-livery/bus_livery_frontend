import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cfeature/report/application/report_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/livery_styles.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/extensions.dart';
import 'package:livery/utils/styles.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LiveryBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/buss_logo.png', height: 70),
      ),
      body: Padding(
        padding: AppSize.swPadding,
        child: BlocBuilder<LiveryBloc, LiveryState>(
          builder: (context, state) {
            List<LiveryModel>? liveryData = state.getAllLiveryRes.apiData?.data;
            return WWResponseHandler(
              data: state.getAllLiveryRes,
              apiCall: () async {
                context.read<LiveryBloc>().add(GetAllLiveryApiEvent());
              },
              isEmpty: liveryData?.isEmpty ?? true,
              child: ListView.separated(
                separatorBuilder: (context, index) => AppSize.sizedBox1h,
                itemCount: liveryData?.length ?? 0,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return PostWidget(
                    key: ValueKey(liveryData![index].id),
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

class PostWidget extends StatelessWidget {
  final LiveryBloc bloc;
  final LiveryModel data;
  const PostWidget({super.key, required this.data, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                postOwnerDetail(context, data: data),
                //
                _MoreOptons(context, bloc: bloc, data: data),
              ],
            ),
          ),
          //
          postImage(),
          //
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WwText(
                  text: data.liveryName ?? '',
                  style: LiveryStyles.liveryName(),
                ),
                AppSize.sizedBox1h,
                //
                postDownload(context),
                //
                AppSize.sizedBox1h,
                WwText(
                  text: data.description ?? '',
                  style: LiveryStyles.description(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row postDownload(BuildContext context) {
    return Row(
      children: [
        const Icon(CupertinoIcons.cloud_download, color: AppColors.primary),
        AppSize.sizedBox1w,
        WwText(text: '15', style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  ClipRRect postImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: CachedNetworkImage(
        height: 200,
        width: double.infinity,
        imageUrl:
            data.postImage?.liveryImage1080 ??
            '', //   "https://i.pinimg.com/736x/09/a6/d6/09a6d6ff2a65445a72fbf91c746e6dfd.jpg",
        fit: BoxFit.cover,
        placeholder:
            (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget:
            (context, url, error) =>
                const Icon(Icons.error, color: AppColors.primary),
      ),
    );
  }

  Row postOwnerDetail(BuildContext context, {required LiveryModel data}) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s',
          ),
        ),
        AppSize.sizedBox2w,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WwText(
              text: data.user?.username ?? '',
              style: LiveryStyles.profileName(),
            ),
            WwText(
              text: data.createdAt?.displayDDMMYY() ?? '',
              style: LiveryStyles.date(),
            ),
          ],
        ),
      ],
    );
  }
}

class _MoreOptons extends StatelessWidget {
  final BuildContext context;
  final LiveryBloc bloc;
  final LiveryModel data;
  const _MoreOptons(this.context, {required this.bloc, required this.data});

  @override
  Widget build(BuildContext context) {
    customPrint(key);
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
      builder: (context, state) {
        customPrint('_MoreOptons', name: 'builder');
        return state.deleteLiveryRes.status == ApiStatus.loading
            ? CupertinoActivityIndicator()
            : postUpdate(context);
      },
    );
  }

  IconButton postUpdate(BuildContext context) {
    return IconButton(
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
                  const ListTile(
                    leading: Icon(Icons.edit),
                    title: WwText(text: 'Edit Livery'),
                  ),
                  ListTile(
                    leading: Icon(Icons.report),
                    title: WwText(text: 'Report Livery'),
                    onTap: () {
                      showBottomSheet();
                      // context.router.maybePop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: WwText(text: 'Delete Livery'),
                    onTap: () {
                      context.router.maybePop();
                      bloc.add(DeleteLiveryApiEvent(liveryId: data.id!));
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.more_horiz, color: AppColors.primary),
    );
  }

  showBottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: BlocSelector<ReportBloc, ReportState, List<dynamic>>(
              selector: (state) {
                return state.getReportReasonsRes.apiData ?? <dynamic>[];
              },
              builder: (context, state) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 4,
                  ),
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return reportDecoration(state[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  InkWell reportDecoration(String text) {
    return InkWell(
      onTap: () {
        context.router.maybePop();
        context.read<ReportBloc>().add(
          ReportContentApiEvent(
            reportType: ReportType.livery,
            id: data.id,
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
