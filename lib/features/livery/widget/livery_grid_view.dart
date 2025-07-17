import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/livery_styles.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery/widget/livery_list_view.dart';
import 'package:livery/features/livery/widget/livery_more_options.dart';

class LiveryGridView extends StatelessWidget {
  final LiveryBloc bloc;
  final LiveryModel data;
  final int index;

  const LiveryGridView({
    super.key,
    required this.data,
    required this.bloc,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Show full post details
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: LiveryListView(
                        index: index,
                        bloc: bloc,
                        data: data,
                      ),
                    );
                  },
                );
              },
              child: CachedNetworkImage(
                imageUrl: data.postImage?.liveryImage200 ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),

          // Title and Actions
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Livery name
                WwText(
                  text: data.liveryName ?? '',
                  style: LiveryStyles.liveryName(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 4),

                // Owner name
                if (data.user?.username != null)
                  WwText(
                    text: 'by ${data.user?.username}',
                    style: LiveryStyles.profileName(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                SizedBox(height: 4),

                // Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Downloads count
                    Row(
                      children: [
                        Icon(Icons.download_outlined, size: 16),
                        SizedBox(width: 4),
                        WwText(
                          text: '${data.downloadCount ?? 0}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    // More options
                    LiveryMoreOptions(bloc: bloc, data: data),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
