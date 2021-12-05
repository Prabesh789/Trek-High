import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trek_high/core/widgets/custom_notification.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';
import 'package:trek_high/features/home_screen/presentation/widgets/drawer_nav_bar.dart';

class HomeScreen extends StatefulHookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          tr('popular_treks'),
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: const [CustomNotification()],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('trek_destination')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          final destinationData = snapshots.data?.docs;
          if (snapshots.data == null) {
            return const Center(
              child: Text('Loading...'),
            );
          } else if (destinationData!.isEmpty) {
            return const Center(
              child: Text('No any destination yet...!'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: destinationData.length,
                itemBuilder: (context, item) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        height: size.height / 4,
                        width: size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CachedNetworkImage(
                                imageUrl: '${destinationData[item]['image']}',
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
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(.4),
                                          BlendMode.darken,
                                        ),
                                        image: imageProvider,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 20,
                                ),
                                child: Text(
                                  '${destinationData[item]['title']}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
