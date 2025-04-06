import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/top_users/application/top_users_bloc.dart';

class TopUsersScreen extends StatelessWidget {
  const TopUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TopUsersBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('Top Users')),
      body: BlocSelector<TopUsersBloc, TopUsersState, TopUsersState>(
        selector: (state) => state,
        builder: (context, state) {
          return WWResponseHandler(
            data: state.getTopUsersRes,
            apiCall: () async => bloc.add(FetchTopUsers()),
            isEmpty: state.getTopUsersRes.apiData?.isEmpty ?? true,
            child: ListView.builder(
              itemCount: state.getTopUsersRes.apiData?.length ?? 0,
              itemBuilder: (context, index) {
                final user = state.getTopUsersRes.apiData![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.dp ?? ''),
                    radius: 25.r,
                  ),
                  title: WwText(text: user.username ?? ''),
                  subtitle: Row(
                    children: [
                      WwText(text: '${user.likeCount ?? 0} likes'),
                      SizedBox(width: 10.w),
                      WwText(text: '${user.violationCount ?? 0} violations'),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
