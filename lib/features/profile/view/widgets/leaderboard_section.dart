import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/features/profile/model/leaderboard_model.dart';
import 'package:livery/utils/app_size.dart';

class LeaderboardSection extends StatelessWidget {
  const LeaderboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLeaderboardHeader(context, theme),
        AppSize.sizedBox2h,
        _buildLeaderboardList(theme),
      ],
    );
  }

  Widget _buildLeaderboardHeader(BuildContext context, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WwText(
            text: "Weekly Leaderboard",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              size: 20.r,
              color: theme.colorScheme.primary,
            ),
            onPressed: () {
              context.read<ProfileBloc>().add(GetLeaderboardEvent());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardList(ThemeData theme) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          previous.leaderboardRes.status != current.leaderboardRes.status ||
          previous.getProfileRes.apiData?.username !=
              current.getProfileRes.apiData?.username,
      builder: (context, state) {
        final status = state.leaderboardRes.status;
        final leaderboard = state.leaderboardRes.apiData;
        final currentUsername = state.getProfileRes.apiData?.username ?? '';

        if (status == ApiStatus.loading) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        if (status == ApiStatus.failure) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: [
                WwText(
                  text:
                      state.leaderboardRes.errorMessage ??
                      "Failed to load leaderboard",
                  style: TextStyle(color: theme.colorScheme.error),
                ),
                TextButton(
                  onPressed: () {
                    context.read<ProfileBloc>().add(GetLeaderboardEvent());
                  },
                  child: const WwText(text: "Retry"),
                ),
              ],
            ),
          );
        }

        if (leaderboard == null || leaderboard.data.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: const Center(
              child: WwText(text: "No rankings available yet."),
            ),
          );
        }

        final entries = leaderboard.data;
        final isCurrentUserInTop = entries.any(
          (e) => e.username == currentUsername,
        );

        return Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: entries.length,
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final entry = entries[index];
                final isMe = entry.username == currentUsername;
                return _buildLeaderboardItem(theme, entry, isMe);
              },
            ),
            if (!isCurrentUserInTop && currentUsername.isNotEmpty) ...[
              SizedBox(height: 16.h),
              WwText(
                text: "Your Position",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 8.h),
              _buildLeaderboardItem(
                theme,
                LeaderboardEntry(
                  id: 0,
                  username: currentUsername,
                  points: leaderboard.currentUserPoints,
                  rank: leaderboard.currentUserRank,
                  dp: state.getProfileRes.apiData?.dp,
                ),
                true,
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildLeaderboardItem(
    ThemeData theme,
    LeaderboardEntry entry,
    bool isMe,
  ) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isMe
            ? theme.colorScheme.primary.withValues(alpha: 0.12)
            : theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isMe
              ? theme.colorScheme.primary.withValues(alpha: 0.4)
              : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
          width: isMe ? 1.5.r : 1.r,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        child: Row(
          children: [
            _buildRankBadge(entry.rank),
            AppSize.sizedBox3w,
            CircleAvatar(
              radius: 18.r,
              backgroundImage: entry.dp != null && entry.dp!.isNotEmpty
                  ? NetworkImage(entry.dp!)
                  : null,
              child: entry.dp == null || entry.dp!.isEmpty
                  ? Icon(Icons.person, size: 18.r, color: Colors.grey)
                  : null,
            ),
            AppSize.sizedBox3w,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: WwText(
                          text: entry.username,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: isMe
                                ? FontWeight.bold
                                : FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (entry.rank == 1) ...[
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.workspace_premium,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ],
                      if (isMe) ...[
                        SizedBox(width: 6.w),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 2.h,
                            ),
                            child: WwText(
                              text: "YOU",
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            AppSize.sizedBox2w,
            WwText(
              text: "${entry.points} pts",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankBadge(int rank) {
    Color badgeColor;
    Color textColor = Colors.white;

    switch (rank) {
      case 1:
        badgeColor = Colors.amber;
        break;
      case 2:
        badgeColor = const Color(0xFFC0C0C0); // Silver
        break;
      case 3:
        badgeColor = const Color(0xFFCD7F32); // Bronze
        break;
      default:
        badgeColor = Colors.grey.withValues(alpha: 0.2);
        textColor = Colors.grey[700]!;
        break;
    }

    final isTop3 = rank <= 3;

    return SizedBox(
      width: 28.w,
      height: 28.w,
      child: DecoratedBox(
        decoration: BoxDecoration(color: badgeColor, shape: BoxShape.circle),
        child: Center(
          child: WwText(
            text: "$rank",
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: isTop3 ? Colors.black87 : textColor,
            ),
          ),
        ),
      ),
    );
  }
}
