import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trek_high/app_setup/route/app_router.dart';
import 'package:trek_high/core/widgets/custom_button.dart';
import 'package:trek_high/features/landing_screen/widgets/wolk_through_data.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.indigoAccent[100],
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
          ),
          Column(
            children: [
              const SizedBox(height: 80),
              SizedBox(
                height: size.height / 1.5,
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: walkThroughData.length,
                  itemBuilder: (context, item) {
                    final walkThroughItem = walkThroughData[item];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            height: size.height / 2.3,
                            child: SvgPicture.asset(
                                walkThroughItem['image'] ?? ''),
                          ),
                        ),
                        Text(
                          walkThroughItem['title'] ?? '',
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            walkThroughItem['description'] ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontSize: 16),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                count: walkThroughData.length,
                controller: _pageController,
                effect: WormEffect(
                  dotColor: Colors.indigoAccent[100]!,
                  activeDotColor: Colors.lightBlue[900]!,
                  dotHeight: 6.5,
                  dotWidth: 6.5,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomButton(
                  buttonText: 'Get Started',
                  onPressed: () {
                    context.router.push<void>(const LoginRoute());
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
