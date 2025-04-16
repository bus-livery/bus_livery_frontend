import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cfeature/report/application/report_bloc.dart';
import 'package:livery/Cfeature/report/widget/ww_report_content.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_livery_status_display.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/livery_styles.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/custom_print.dart';
import 'package:livery/utils/extensions.dart';
import 'package:livery/utils/router/router.gr.dart';
import 'package:livery/utils/styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LiveryBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/buss_logo.png', height: 70),
        actions: [filterOptions(context)],
      ),
      body: Padding(
        padding: AppSize.swPadding,
        child: BlocBuilder<LiveryBloc, LiveryState>(
          buildWhen:
              (p, c) => p.getAllLiveryRes.status != c.getAllLiveryRes.status,
          builder: (context, state) {
            customPrint('BLOC BUILDER - FeedScreen');
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
                    index: index,
                    bloc: bloc,
                    data: liveryData![index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  IconButton filterOptions(BuildContext context) {
    return IconButton(
      onPressed: () {
        final bloc = context.read<LiveryBloc>();

        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: BlocSelector<LiveryBloc, LiveryState, LiveryFilter>(
                selector: (state) => state.filter,
                builder: (context, state) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AppSize.sizedBox3h,
                      ListTile(
                        leading: Icon(Icons.new_label_outlined),
                        title: WwText(text: 'Latest'),
                        onTap: () {
                          bloc.add(
                            FilterLiveryEvent(filter: LiveryFilter.latest),
                          );
                        },
                        trailing: Checkbox(
                          value: state == LiveryFilter.latest,
                          onChanged: (v) {
                            bloc.add(
                              FilterLiveryEvent(filter: LiveryFilter.latest),
                            );
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.download_for_offline_outlined),
                        title: WwText(text: 'Most Downloaded'),
                        onTap: () {
                          bloc.add(
                            FilterLiveryEvent(
                              filter: LiveryFilter.mostDownloaded,
                            ),
                          );
                        },
                        trailing: Checkbox(
                          value: state == LiveryFilter.mostDownloaded,
                          onChanged: (v) {
                            bloc.add(
                              FilterLiveryEvent(
                                filter: LiveryFilter.mostDownloaded,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.filter_alt_outlined, color: AppColors.primary),
    );
  }
}

class PostWidget extends StatelessWidget {
  final LiveryBloc bloc;
  final LiveryModel data;
  final int index;
  const PostWidget({
    super.key,
    required this.data,
    required this.bloc,
    required this.index,
  });

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
                postOwnerDetail(
                  context,
                  data: data,
                ), // POST OWNER DETAIL ----------
                //
                Row(
                  children: [
                    postDownload(),
                    _MoreOptons(context, bloc: bloc, data: data),
                  ],
                ),
              ],
            ),
          ),
          //
          postImage(context), // POST IMAGE --------------------------------
          //
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(),
                WwText(
                  text: data.liveryName ?? '',
                  style: LiveryStyles.liveryName(),
                ),
                AppSize.sizedBox1h,
                //
                if (data.description?.isNotEmpty ?? false)
                  WwText(
                    text: data.description ?? '',
                    style: LiveryStyles.description(),
                  ),
                AppSize.sizedBox1h,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget postDownload() {
    return BlocSelector<LiveryBloc, LiveryState, int?>(
      selector: (state) {
        return state.getAllLiveryRes.apiData?.data?[index].downloadCount;
      },
      builder: (context, count) {
        customPrint('BLOC BUILDER - postDownload');
        return IconButton(
          onPressed: () async {
            downloadAndSaveImageWithDio(bloc, data);
          },
          icon: Row(
            children: [
              WwText(text: count?.toString() ?? '', style: normalText()),
              SizedBox(width: 05),
              Icon(Icons.downloading_outlined),
            ],
          ),
        );
      },
    );
  }

  ClipRRect postImage(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            imageUrl: data.postImage?.liveryImage1080 ?? '',
            fit: BoxFit.cover,
            placeholder:
                (context, url) =>
                    const Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) =>
                    const Icon(Icons.error, color: AppColors.primary),
          ),
          if (data.approvalStatus == ApprovalStatus.waiting.name) ...[
            SizedBox(height: 200, width: double.infinity, child: liverShade),
            WwLiveryWaiting(),
          ],
        ],
      ),
    );
  }

  InkWell postOwnerDetail(BuildContext context, {required LiveryModel data}) {
    return InkWell(
      onTap: () {
        context.router.push(OtherProfileRoute(profileData: data.user));
      },
      child: Row(
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
      ),
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
      builder: (context, deleteStatus) {
        customPrint('LIVERY BLOC BUILDER - _MoreOptons');
        return deleteStatus.deleteLiveryRes.status == ApiStatus.loading
            ? CupertinoActivityIndicator()
            : buildMoreOptions(context);
      },
    );
  }

  IconButton buildMoreOptions(BuildContext context) {
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
      builder: (BuildContext _) {
        return WwReportContent(
          context,
          contentId: data.id,
          type: ReportType.livery,
        );
      },
    );
  }
}

Future<void> downloadAndSaveImageWithDio(
  LiveryBloc bloc,
  LiveryModel data,
) async {
  try {
    bloc.add(DownloadLiveryApiEvent(liveryId: data.id));

    final imageUrl = data.postImage?.liveryImageOriginal;

    if (imageUrl == null || imageUrl.isEmpty) {
      throw Exception("Image URL is empty");
    }

    final dio = Dio();

    // Extract filename from URL
    final uri = Uri.parse(imageUrl);
    final fileName =
        uri.pathSegments.isNotEmpty
            ? uri.pathSegments.last
            : "downloaded_image.png";
    final sanitizedFileName = fileName.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');

    Directory? directory;

    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted ||
          await Permission.manageExternalStorage.request().isGranted) {
        directory = Directory("/storage/emulated/0/Download");
      } else {
        throw Exception("Storage permission denied");
      }
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getDownloadsDirectory();
    }

    if (directory == null) {
      throw Exception("Could not find a directory to save the file");
    }

    final filePath = "${directory.path}/$sanitizedFileName";

    // Download image using Dio and save to file
    await dio.download(
      imageUrl,
      filePath,
      options: Options(responseType: ResponseType.bytes),
    );

    showSuccessToast(message: 'File downloaded successfully');

    customPrint("File downloaded successfully to: $filePath");
  } catch (e) {
    customPrint("Error downloading or saving file: $e");
  }
}
