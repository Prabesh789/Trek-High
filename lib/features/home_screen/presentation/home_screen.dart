import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trek_high/core/widgets/custom_notification.dart';
import 'package:trek_high/core/widgets/custom_shimmer.dart';
import 'package:trek_high/features/home_screen/presentation/widgets/drawer_nav_bar.dart';
import 'package:trek_high/features/home_screen/presentation/widgets/static_data.dart';

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          tr('home_screen'),
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: const [CustomNotification()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Lognest Trails',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: size.height / 4,
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: landingPageData.length,
                itemBuilder: (context, item) {
                  final data = landingPageData[item];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
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
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: landingPageData.length,
                  effect: WormEffect(
                    dotColor: Colors.indigoAccent[100]!,
                    activeDotColor: Colors.lightBlue[900]!,
                    dotHeight: 6.5,
                    dotWidth: 6.5,
                  ),
                  onDotClicked: (index) {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: size.height,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text('First'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text('Second'),
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/mountain.png'),
          ],
        ),
      ),
    );
  }
}
