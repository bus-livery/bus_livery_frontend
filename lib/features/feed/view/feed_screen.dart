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
        title: Image.asset(
          'assets/images/buss_logo.png',
          height: 70,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: AppSize.swPadding,
        child: ListView.separated(
            separatorBuilder: (context, index) => AppSize.sizedBox1h,
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s'),
                              ),
                              AppSize.sizedBox2w,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WwText(text: 'Jithin'),
                                  WwText(
                                      text: '20 Aug 2020',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: CachedNetworkImage(
                        height: 200,
                        width: double.infinity,
                        imageUrl:
                            "https://i.pinimg.com/736x/09/a6/d6/09a6d6ff2a65445a72fbf91c746e6dfd.jpg",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WwText(text: 'Kompan Livery'),
                          AppSize.sizedBox1h,
                          Row(
                            children: [
                              Icon(CupertinoIcons.cloud_download),
                              AppSize.sizedBox1w,
                              WwText(
                                  text: '15',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
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
            }),
      )),
    );
  }
}
