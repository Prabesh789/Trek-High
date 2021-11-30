import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/features/find_friends/presentation/find_friends.dart';
import 'package:trek_high/features/find_me_screen/presentation/find_me_screen.dart';
import 'package:trek_high/features/home_screen/presentation/home_screen.dart';
import 'package:trek_high/features/main_dashboard/presentation/widgets/index_notifier.dart';
import 'package:trek_high/features/profile_screen/presentation/profile_screen.dart';
import 'package:trek_high/features/share_story/presentation/share_story.dart';

class BottomNavigationScreen extends StatefulHookWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    ShareStoryScreen(),
    FindMeScreen(),
    FindFriends(),
    ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    context.read(indexNotifierProvider.notifier).changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final index = useProvider(indexNotifierProvider);
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _screens.elementAt(index),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 50,
              color: Colors.grey.withOpacity(0.04),
            ),
          ],
          borderRadius: const BorderRadius.only(
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
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            currentIndex: index, //New
            onTap: _onItemTapped,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            iconSize: 26,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedLabelStyle:
                Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 1,
                    ),
            selectedLabelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 1,
                ),
            selectedIconTheme: IconThemeData(
              color: Colors.black.withOpacity(0.8),
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.black.withOpacity(0.5),
            ),

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    bottom: 6,
                  ),
                  child: Icon(
                    Icons.home,
                    size: 29,
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
                icon: const Icon(
                  Icons.home,
                  size: 29,
                ),
                label: tr(''),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    bottom: 6,
                  ),
                  child: Icon(
                    Icons.image,
                    size: 28,
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
                icon: const Icon(
                  Icons.image,
                  size: 28,
                ),
                label: tr(''),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    bottom: 6,
                  ),
                  child: Icon(
                    Icons.person_pin_circle,
                    size: 28,
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
                icon: const Icon(
                  Icons.person_pin_circle,
                  size: 28,
                ),
                label: tr(''),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    bottom: 6,
                  ),
                  child: Icon(
                    Icons.hiking,
                    size: 28,
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
                icon: const Icon(
                  Icons.hiking,
                  size: 28,
                ),
                label: tr(''),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    bottom: 6,
                  ),
                  child: Icon(
                    Icons.account_circle,
                    size: 28,
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
                icon: const Icon(
                  Icons.account_circle,
                  size: 28,
                ),
                label: tr(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
