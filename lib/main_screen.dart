import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box2_buttons.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box_violation.dart';
import 'package:livery/features/horn/view/horn_feed_screen.dart';
import 'package:livery/features/livery/view/feed_screen.dart';
import 'package:livery/features/profile/view/points_screen.dart';
import 'package:livery/features/profile/view/profile_screen.dart';
import 'package:livery/features/top_users/view/top_users_screen.dart';
import 'package:livery/service/shared_pref_service.dart';
import 'package:livery/utils/di/injection.dart';
import 'package:livery/utils/router/router.gr.dart';
import 'package:livery/utils/router/router_names.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const Center(child: FeedScreen()),
    const Center(child: HornFeedScreen()),
    const Center(child: PointsScreen()),
    const Center(child: TopUsersScreen()),
    const Center(child: ProfileScreen()),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) async {
      SharedPrefService sharedPS = getIt<SharedPrefService>();
      if (sharedPS.getString('app_opened') == null &&
          sharedPS.getString('token') != null) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: WWDialogueBoxViolation(
                text: 'Community Guidelines',
                textSub: '''
To ensure a safe and respectful environment, please review our community guidelines. By continuing, you agree to follow these rules. Violations may lead to warnings or account restrictions.

Would you like to add a confirmation button like "I Agree" or "Continue"
''',
                onClose: () {
                  sharedPS.saveString('app_opened', 'true');
                  context.router.maybePop();
                },
              ),
            );
          },
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sharedPS = getIt<SharedPrefService>();
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) return true;

        setState(() {
          _currentIndex = 0;
        });

        return false;
      },
      child: Material(
        child: InkWell(
          onTap: sharedPS.getString('token') == null
              ? () {
                  wwDialogueBox2Button(
                    context,
                    textSub: 'Please login to continue',
                    secondTap: () {
                      context.router.replaceAll([const GmailWithOtpRoute()]);
                    },
                  );
                }
              : null,
          child: IgnorePointer(
            ignoring: sharedPS.getString('token') == null,
            child: Scaffold(
              body: PageTransitionAnimation(
                currentIndex: _currentIndex,
                tabs: _tabs,
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  if (_currentIndex == 1) {
                    context.router.pushPath(RouterNames.hornCreateScreen);
                  } else {
                    context.router.pushPath(RouterNames.liveryCreateScreen);
                  }
                },
              ),
              bottomNavigationBar: ConvexAppBar(
                style: TabStyle.fixedCircle,
                backgroundColor: theme.colorScheme.surface,
                color: theme.colorScheme.onSurfaceVariant,
                activeColor: theme.colorScheme.primary,
                initialActiveIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    if (_currentIndex != index) {
                      _currentIndex = index;
                    }
                  });
                },
                items: const [
                  TabItem(
                    icon: Icons.home,
                    title: 'Feed',
                  ),
                  TabItem(
                    icon: Icons.music_note,
                    title: 'Horn',
                  ),
                  TabItem(
                    icon: Icons.stars,
                    title: 'Rewards',
                  ),
                  TabItem(
                    icon: Icons.people,
                    title: 'Top Users',
                  ),
                  TabItem(
                    icon: Icons.person,
                    title: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PageTransitionAnimation extends StatelessWidget {
  const PageTransitionAnimation({
    super.key,
    required int currentIndex,
    required List<Widget> tabs,
  }) : _currentIndex = currentIndex,
       _tabs = tabs;

  final int _currentIndex;
  final List<Widget> _tabs;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 300),
      reverse: _currentIndex == 0,
      transitionBuilder:
          (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.scaled,
              child: child,
            );
          },
      child: _tabs[_currentIndex],
    );
  }
}
