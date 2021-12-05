import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/features/auth/infrastructure/entities/request/new_signup_request/new_signup_request.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late NewSignupRequest newSignupRequest;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) async {
        if (user == null) {
          await context.router.replace(const LandingRoute());
        } else {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get()
              .then((ds) {
            if (mounted) {
              setState(() {
                newSignupRequest = NewSignupRequest(
                  fullName: ds['fullName'].toString(),
                  address: ds['address'].toString(),
                  admin: ds['admin'] as bool,
                  contact: ds['contact'].toString(),
                  email: ds['email'].toString(),
                  password: ds['password'].toString(),
                  platform: ds['platform'] as int,
                  deviceId: ds['platform'].toString(),
                );
              });
            }
          });
          newSignupRequest.admin == true
              ? await context.router.replace(const AdminDashboardRoute())
              : await context.router.replace(const BottomNavigationRoute());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                'assets/images/mountain.png',
                height: 150,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Trek High',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
