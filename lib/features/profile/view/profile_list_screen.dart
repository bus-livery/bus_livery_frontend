import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cwidgets/ww_app_bar.dart';
import 'package:livery/Cwidgets/ww_error_handler.dart';
import 'package:livery/Cwidgets/ww_profile_tile.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/utils/router/router.gr.dart';

@RoutePage()
class ProfileListScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext ctx) {
    return BlocProvider.value(
      value: BlocProvider.of<ProfileBloc>(ctx)..add(GetLikedProfilesApi()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WwAppBar(title: 'Liked Profiles'),
      body: BlocSelector<
        ProfileBloc,
        ProfileState,
        ApiResponse<List<ProfileModel>>
      >(
        selector: (state) => state.getLikedProfiles,
        builder: (context, state) {
          final bloc = context.read<ProfileBloc>();
          return WWResponseHandler(
            data: state,
            isEmpty: state.apiData?.isEmpty ?? true,
            apiCall: () async => bloc.add(GetLikedProfilesApi()),
            child: ListView.builder(
              itemCount: state.apiData?.length ?? 0,
              itemBuilder: (_, i) {
                final p = state.apiData![i];
                return WwProfileTile(
                  title: p.username ?? '',
                  subtitle: 'Likes : ${p.likeCount} | Livery : 30',
                  image: '',
                  onTap: () {
                    context.router.push(OtherProfileRoute(profileData: p));
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
