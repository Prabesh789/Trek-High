import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trek_high/core/widgets/custom_notification.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';
import 'package:trek_high/features/home_screen/presentation/widgets/drawer_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          tr('profile'),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
        actions: const [CustomNotification()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: size.height / 1.4,
            width: size.width / 1.3,
            decoration: BoxDecoration(
              color: Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: Colors.black.withOpacity(0.08),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 25),
                StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(userId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircleAvatar(
                        radius: 65,
                        child: Center(
                          child: CustomShimmer(),
                        ),
                      );
                    } else if (snapshot.data != null) {
                      final userData = snapshot.data! as DocumentSnapshot;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 65,
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
                            const Divider(
                              height: 40,
                            ),
                            profileDetails(
                              context: context,
                              title: 'Full Name: ',
                              detail: '${userData['fullName']}',
                            ),
                            const Divider(),
                            profileDetails(
                              context: context,
                              title: 'Email: ',
                              detail: '${userData['email']}',
                            ),
                            const Divider(),
                            profileDetails(
                              context: context,
                              title: 'Country: ',
                              detail: '${userData['address']}',
                            ),
                            const Divider(),
                            profileDetails(
                              context: context,
                              title: 'Contact: +977 ',
                              detail: '${userData['contact']}',
                            ),
                            const Divider(),
                            profileDetails(
                              context: context,
                              title: 'About me: ',
                              detail: '',
                            ),
                            SizedBox(
                              child: Text(
                                '       ${userData['aboutYou']}',
                                style: Theme.of(context).textTheme.bodyText2,
                                maxLines: 10,
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row profileDetails({
    required BuildContext context,
    // required DocumentSnapshot<Object?> userData,
    required String title,
    required String detail,
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Text(
          detail,
          style: Theme.of(context).textTheme.bodyText2,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
