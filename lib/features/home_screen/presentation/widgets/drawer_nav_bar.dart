import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trek_high/core/theme/application/theme_controller.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';
import 'package:trek_high/features/auth/presentation/login_screen/login_screen.dart';

class DrawerNavBar extends StatefulHookWidget {
  const DrawerNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerNavBar> createState() => _DrawerNavBarState();
}

class _DrawerNavBarState extends State<DrawerNavBar> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String userId = auth.currentUser!.uid;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) async {
        if (user != null) {
          setState(() {
            userId = user.uid;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
            child: StreamBuilder<Object>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(userId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircleAvatar(
                    radius: 45,
                    child: Center(
                      child: CustomShimmer(),
                    ),
                  );
                } else if (snapshot.data != null) {
                  final userData = snapshot.data! as DocumentSnapshot;
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        child: CachedNetworkImage(
                          imageUrl: '${userData['image']}',
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(.1),
                                    BlendMode.darken,
                                  ),
                                  image: imageProvider,
                                ),
                              ),
                            );
                          },
                          errorWidget: (context, error, url) {
                            return const SizedBox();
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${userData['fullName']}',
                        style: GoogleFonts.ptSerif(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        '${userData['email']}',
                        style: GoogleFonts.ptSerif(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 0,
                  color: Theme.of(context).cardColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: SwitchListTile(
                    onChanged: (bool newValue) {
                      context
                          .read(themeController.notifier)
                          .changeTheme(newValue);
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    value: Theme.of(context).brightness == Brightness.dark,
                    title: Text(
                      tr('dark_mode'),
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  color: Theme.of(context).cardColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: ListTile(
                    trailing: const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.logout),
                    ),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().then((value) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (contect) => const LoginScreen(),
                          ),
                        );
                      });
                    },
                    title: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
