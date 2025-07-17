import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/utils/app_colors.dart';

class UploadProgressIndicator extends StatelessWidget {
  const UploadProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LiveryBloc, LiveryState, Map<String, bool>>(
      selector: (state) => state.uploadsInProgress,
      builder: (context, uploadsInProgress) {
        if (uploadsInProgress.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.transparent),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: WwText(
                  text: 'Uploading livery design...',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              WwText(
                text: '${uploadsInProgress.length} in progress',
                style: TextStyle(color: AppColors.primary, fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
