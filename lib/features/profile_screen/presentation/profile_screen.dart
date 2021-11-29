import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trek_high/features/home_screen/presentation/widgets/drawer_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          tr('profile'),
        ),
      ),
    );
  }
}
