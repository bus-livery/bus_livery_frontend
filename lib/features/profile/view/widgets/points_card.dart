import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/utils/app_size.dart';

class PointsCard extends StatelessWidget {
  const PointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          previous.getProfileRes.status != current.getProfileRes.status ||
          previous.leaderboardRes.status != current.leaderboardRes.status,
      builder: (context, state) {
        final profile = state.getProfileRes.apiData;
        final leaderboard = state.leaderboardRes.apiData;
        final points = profile?.points ?? 0;
        final rank = leaderboard?.currentUserRank ?? 0;

        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2E266F), Color(0xFF4A3BB7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2E266F).withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WwText(
                      text: "POINTS BALANCE",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    if (rank > 0)
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 4.h,
                          ),
                          child: WwText(
                            text: "Rank #$rank",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                AppSize.sizedBox1h,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    WwText(
                      text: "$points",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSize.sizedBox1w,
                    WwText(
                      text: "pts",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                AppSize.sizedBox2h,
                Divider(color: Colors.white24, height: 1.h),
                AppSize.sizedBox2h,
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Colors.white70,
                      size: 16,
                    ),
                    AppSize.sizedBox2w,
                    Expanded(
                      child: WwText(
                        text:
                            "Spend points to download liveries and horns. 10 pts per new download.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11.sp,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
