import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/features/home_screen/presentation/widgets/drawer_nav_bar.dart';

class FindFriends extends StatefulHookWidget {
  const FindFriends({Key? key}) : super(key: key);

  @override
  State<FindFriends> createState() => _FindFriendsState();
}

class _FindFriendsState extends State<FindFriends> {
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
          tr('travellers'),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                context.router.push(const PostTravelRoute());
              },
              icon: const Icon(
                Icons.travel_explore_outlined,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('travellers').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SizedBox(
                  height: size.height / 1.5,
                  child: const Center(
                    child: Text(
                      'Loading...',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else if ((snapshot.data! as QuerySnapshot).docs.isEmpty) {
                return SizedBox(
                  height: size.height / 1.5,
                  child: const Center(
                    child: Text(
                      'No any travellers yet.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else if (snapshot.data != null) {
                final travellers = snapshot.data! as QuerySnapshot;
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: travellers.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 25),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(
                                    '${travellers.docs[index]['userId']}',
                                  )
                                  .snapshots(),
                              builder: (context, snapshots) {
                                if (!snapshots.hasData) {
                                  return const SizedBox();
                                  // ignore: unnecessary_null_comparison
                                } else if (snapshots.hasData != null) {
                                  final individualUserData =
                                      snapshots.data! as DocumentSnapshot;
                                  final user =
                                      individualUserData.data()! as Map;
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          aboutTraveller(
                                            name: '${user['fullName']}',
                                            about: '${user['aboutYou']}',
                                            context: context,
                                          );
                                        },
                                        child: CircleAvatar(
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
                                      ),
                                      Text(
                                        user['fullName'].toString(),
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
                                      const Divider(),
                                    ],
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width / 1.5,
                                  child: Text(
                                    '${travellers.docs[index]['trek']}',
                                    maxLines: 4,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                if ('${travellers.docs[index]['isContact']}'
                                    .isNotEmpty) ...[
                                  RichText(
                                    text: TextSpan(
                                      text: '',
                                      children: [
                                        TextSpan(
                                          text: 'Contact: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${travellers.docs[index]['isContact']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                                if ('${travellers.docs[index]['isEmail']}'
                                    .isNotEmpty) ...[
                                  RichText(
                                    text: TextSpan(
                                      text: '',
                                      children: [
                                        TextSpan(
                                          text: 'Email: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${travellers.docs[index]['isEmail']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '',
                                      children: [
                                        TextSpan(
                                          text: 'Trek date: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${travellers.docs[index]['date']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ]
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, item) {
                    return Container(
                      color: Colors.grey,
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  void aboutTraveller(
      {required BuildContext context,
      required String name,
      required String about}) {
    final Widget yesButton = TextButton(
      child: Text(
        'Close',
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            title: Text(
              'About $name',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            content: Text(
              about,
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              yesButton,
            ],
          ),
        );
      },
    );
  }
}
