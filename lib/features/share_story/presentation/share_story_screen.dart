import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        // toolbarHeight: 70,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [Colors.indigoAccent, Colors.indigoAccent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        title: Text(
          tr('stories'),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
        // actions: const [CustomNotification()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
                child: HookBuilder(
                  builder: (context) {
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
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                      Colors.black
                                                          .withOpacity(.1),
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
                                        ),
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                  },
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                child: StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection('travelers_stories')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<Object> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No stories are posted yet.'),
                      );
                    } else if (snapshot.data != null) {
                      final storiesData = snapshot.data! as QuerySnapshot;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: storiesData.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .inputDecorationTheme
                                    .fillColor,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 10),
                                    blurRadius: 50,
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(
                                            '${storiesData.docs[index]['userId']}',
                                          )
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return const SizedBox();
                                          // ignore: unnecessary_null_comparison
                                        } else if (snapshot.hasData != null) {
                                          final individualUserData = snapshot
                                              .data! as DocumentSnapshot;
                                          final user =
                                              individualUserData.data()! as Map;
                                          return Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                child: CachedNetworkImage(
                                                  imageUrl: '${user['image']}',
                                                  imageBuilder:
                                                      (context, imageProvider) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                            Colors.black
                                                                .withOpacity(
                                                                    .1),
                                                            BlendMode.darken,
                                                          ),
                                                          image: imageProvider,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  errorWidget:
                                                      (context, error, url) {
                                                    return const SizedBox();
                                                  },
                                                ),
                                              ),
                                              Text(
                                                user['fullName'].toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    ?.copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                maxLines: 20,
                                                textAlign: TextAlign.justify,
                                              ),
                                              const Divider(),
                                            ],
                                          );
                                        } else {
                                          return const SizedBox();
                                        }
                                      },
                                    ),
                                    Text(
                                      '${storiesData.docs[index]['title']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      maxLines: 20,
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      height: size.height / 5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(18),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '${storiesData.docs[index]['image']}',
                                          fit: BoxFit.cover,
                                          placeholder: (contexr, url) {
                                            return CustomShimmer(
                                              radius: 0,
                                              height: size.height / 4,
                                              width: size.width,
                                            );
                                          },
                                          errorWidget: (context, error, url) {
                                            return CustomShimmer(
                                              radius: 0,
                                              height: size.height / 4,
                                              width: size.width,
                                            );
                                          },
                                          imageBuilder:
                                              (context, imageProvider) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(.4),
                                                    BlendMode.darken,
                                                  ),
                                                  image: imageProvider,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        if (storiesData.docs[index]
                                                ['isFavorite'] ==
                                            false) ...[
                                          InkWell(
                                            onTap: () async {
                                              await FirebaseFirestore.instance
                                                  .collection(
                                                      'travelers_stories')
                                                  .doc(storiesData
                                                      .docs[index].id)
                                                  .update(
                                                {'isFavorite': true},
                                              );
                                            },
                                            child: Icon(
                                              Icons.favorite_outline,
                                              size: 45,
                                              color: Theme.of(context)
                                                  .appBarTheme
                                                  .backgroundColor,
                                            ),
                                          ),
                                        ] else ...[
                                          InkWell(
                                            onDoubleTap: () async {
                                              await FirebaseFirestore.instance
                                                  .collection(
                                                      'travelers_stories')
                                                  .doc(storiesData
                                                      .docs[index].id)
                                                  .update(
                                                {'isFavorite': false},
                                              );
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              size: 45,
                                              color: Theme.of(context)
                                                  .appBarTheme
                                                  .backgroundColor,
                                            ),
                                          ),
                                        ],
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
