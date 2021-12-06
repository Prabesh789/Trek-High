import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/core/widgets/custom_notification.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';
import 'package:trek_high/features/auth/application/auth_controller.dart';
import 'package:trek_high/features/home_screen/presentation/widgets/drawer_nav_bar.dart';
import 'package:trek_high/features/share_story/presentation/widgets/story_details_bottom_sheet.dart';

class ShareStoryScreen extends StatefulHookWidget {
  const ShareStoryScreen({Key? key}) : super(key: key);

  @override
  State<ShareStoryScreen> createState() => _ShareStoryScreenState();
}

class _ShareStoryScreenState extends State<ShareStoryScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          tr('stories'),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
        actions: const [CustomNotification()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: size.height / 8,
              width: size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: HookBuilder(builder: (context) {
                final userId = useProvider(userIdProvider);
                return StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(userId.state)
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
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
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
                                    const SizedBox(height: 5),
                                    Text(
                                      '${userData['fullName']}',
                                    )
                                  ],
                                ),
                                const SizedBox(width: 30),
                                InkWell(
                                  onTap: () {
                                    StoryDetailBottomSheet
                                        .showStoryDetailBottomSheet(
                                            context: context);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(width: 40),
                                          Text(
                                            'Share your Stories...',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: const [
                                          SizedBox(width: 40),
                                          Icon(Icons.image_outlined),
                                          SizedBox(width: 40),
                                          Icon(Icons.text_fields),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
