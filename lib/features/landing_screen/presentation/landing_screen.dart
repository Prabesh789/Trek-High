import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trek_high/core/theme/application/theme_controller.dart';
import 'package:trek_high/core/widgets/custom_button.dart';
import 'package:trek_high/features/landing_screen/presentation/widgets/wolk_through_data.dart';
import 'package:trek_high/core/theme/infrastructure/entities/theme_palatte.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 50),
          Text(
            'Welcome To Trek-High App',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
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
                        height: size.height / 2,
                        child: SvgPicture.asset(walkThroughItem['image'] ?? ''),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(walkThroughItem['description'] ?? ''),
                  ],
                );
              },
            ),
          ),
          SmoothPageIndicator(
            count: walkThroughData.length,
            controller: _pageController,
            effect: WormEffect(
              paintStyle: PaintingStyle.stroke,
              dotColor: Colors.black,
              activeDotColor: Colors.lightBlue[900]!,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomButton(
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
