import 'package:flutter/material.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_custom_loader.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/utils/app_size.dart';

class WWResponseHandler extends StatelessWidget {
  final ApiResponse<dynamic> data;
  final Future<void> Function() apiCall;
  final bool? isEmpty;
  final Widget child;
  const WWResponseHandler({
    super.key,
    required this.data,
    required this.apiCall,
    required this.isEmpty,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: apiCall,
      child: Stack(
        alignment: Alignment.center,
        children: [
          (data.status == ApiStatus.loading)
              ? LoaderContainerWithMessage(message: "")
              : data.errorMessage != null
              ? Center(
                child: WWDialogueBoxError(
                  onTap: apiCall,
                  textSub: data.errorMessage!,
                ),
              )
              : isEmpty ?? true
              ? const EmptyDataWidget()
              : child,
        ],
      ),
    );
  }
}

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CircleAvatar(
          //   radius: 28.r,
          //   backgroundColor: Theme.of(context).colorScheme.primary,
          //   child: const Icon(
          //     Icons.list,
          //     color: Colors.white,
          //     size: 33,
          //   ),
          // ),
          AppSize.sizedBox2h,
          Text(
            'No Data Found \n There is currently no data to display.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
