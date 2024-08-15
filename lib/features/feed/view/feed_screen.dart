import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livery/common_widgets/ww_text.dart';
import 'package:livery/utils/app_size.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/buss_logo.png', height: 70),
      ),
      body: Padding(
        padding: AppSize.swPadding,
        child: ListView.separated(
            separatorBuilder: (context, index) => AppSize.sizedBox1h,
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return const PostWidget();
            }),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
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
                postOwnerDetail(context),
                //
                postUpdate(context)
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
                const WwText(text: 'Kompan Livery'),
                AppSize.sizedBox1h,
                //
                postDownload(context),
                //
                AppSize.sizedBox1h,
                WwText(
                  text:
                      'My knowledge extends to other relevant technologies and frameworks, ensuring that I can contribute effectively to various aspects of your projects.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
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
                    title: WwText(text: 'Edit Post'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.delete),
                    title: WwText(text: 'Delete Post'),
                  ),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.more_horiz),
    );
  }

  Row postDownload(BuildContext context) {
    return Row(
      children: [
        const Icon(CupertinoIcons.cloud_download),
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
            'https://buslivery.s3.eu-north-1.amazonaws.com/livery/livery_200/2024-07-07+15%3A22%3A17.396364+%2B0530+IST+m%3D%2B6.934072668', //   "https://i.pinimg.com/736x/09/a6/d6/09a6d6ff2a65445a72fbf91c746e6dfd.jpg",
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Row postOwnerDetail(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s'),
        ),
        AppSize.sizedBox2w,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WwText(text: 'Jithin'),
            WwText(
                text: '20 Aug 2020',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
