import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:livery/features/livery/view/feed_screen.dart';
import 'package:livery/features/profile/view/profile_screen.dart';
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
    const Center(child: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) return true;

        setState(() {
          _currentIndex = 0;
        });

        return false;
      },
      child: Scaffold(
        body: PageTransitionAnimation(currentIndex: _currentIndex, tabs: _tabs),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            context.router.pushPath(RouterNames.liveryCreateScreen);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              if (_currentIndex != index) {
                _currentIndex = index;
              }
              // if (index == 1 && _currentIndex != index) {
              //   wwLoginDialog(context, onTap: () {});
              // } else {
              //   _currentIndex = index;
              //   print(_currentIndex);
              // }
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
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
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,

          //  _currentIndex == 1
          //     ? SharedAxisTransitionType.scaled
          //     : SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      child: _tabs[_currentIndex], //_buildPage(_currentIndex),
    );
  }
}
