import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trek_high/features/home_screen/widgets/drawer_nav_bar.dart';

class FindFriends extends StatelessWidget {
  const FindFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          tr('travellers'),
        ),
      ),
    );
  }
}
