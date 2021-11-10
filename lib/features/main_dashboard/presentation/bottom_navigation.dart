import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/core/widgets/custom_notification.dart';
import 'package:trek_high/features/find_friends/find_friends.dart';
import 'package:trek_high/features/home_screen/home_screen.dart';
import 'package:trek_high/features/main_dashboard/presentation/widgets/index_notifier.dart';
import 'package:trek_high/features/share_story/share_story.dart';
import 'package:trek_high/features/top_gallery/top_gallery_screen.dart';

class BottomNavigation extends StatefulHookWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    ShareStoryScreen(),
    FindFriends(),
    TopGalleryScreen(),
  ];
  void _onItemTapped(int index) {
    context.read(indexNotifierProvider.notifier).changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final index = useProvider(indexNotifierProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _screens.elementAt(index),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            currentIndex: index, //New
            onTap: _onItemTapped,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            iconSize: 27,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: const Padding(
                  padding: EdgeInsets.only(
                    top: 3,
                    bottom: 6,
                  ),
                  child: Icon(
                    Icons.home,
                  ),
                ),
                icon: const Icon(
                  Icons.home,
                ),
                label: tr('Home'),
              ),
              BottomNavigationBarItem(
                activeIcon: const Padding(
                  padding: EdgeInsets.only(
                    top: 3,
                    bottom: 6,
                  ),
                  child: Icon(
                    Icons.home,
                  ),
                ),
                icon: const Icon(
                  Icons.home,
                ),
                label: tr('Home'),
              ),
              BottomNavigationBarItem(
                activeIcon: const Padding(
                  padding: EdgeInsets.only(
                    top: 3,
                    bottom: 6,
                  ),
                  child: Icon(
                    Icons.home,
                  ),
                ),
                icon: const Icon(
                  Icons.home,
                ),
                label: tr('Home'),
              ),
              BottomNavigationBarItem(
                activeIcon: const Padding(
                  padding: EdgeInsets.only(
                    top: 3,
                    bottom: 6,
                  ),
                  child: Icon(
                    Icons.home,
                  ),
                ),
                icon: const Icon(
                  Icons.home,
                ),
                label: tr('Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
