import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trek_high/core/widgets/custom_notification.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';
import 'package:trek_high/features/home_screen/widgets/drawer_nav_bar.dart';
import 'package:trek_high/features/home_screen/widgets/fake_data.dart';

class HomeScreen extends StatefulHookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _pageController = usePageController();
    return Scaffold(
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          tr('home_screen'),
        ),
        actions: const [
          CustomNotification(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              SizedBox(
                height: size.height / 4,
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: fakedestinationData.length,
                  itemBuilder: (context, item) {
                    final data = fakedestinationData[item];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: CachedNetworkImage(
                        height: size.height / 4,
                        width: size.width - 20,
                        fit: BoxFit.cover,
                        imageUrl: '${data['image']}',
                        errorWidget: (context, error, url) {
                          return CustomShimmer(
                            height: size.height / 5,
                            width: size.width / 1.23,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: fakedestinationData.length,
                  effect: WormEffect(
                    dotColor: Colors.indigoAccent[100]!,
                    activeDotColor: Colors.lightBlue[900]!,
                    dotHeight: 6.5,
                    dotWidth: 6.5,
                  ),
                  onDotClicked: (index) {},
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1599751229070-854ae5c90869?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
