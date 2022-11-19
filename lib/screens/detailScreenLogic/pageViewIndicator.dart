import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorOnPageView extends StatelessWidget {
  const IndicatorOnPageView({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: controller,
        count: 6,
        effect: const WormEffect(
          activeDotColor: Color(0xff2B4C59),
          dotColor: Colors.blue,
          spacing: 5,
          dotHeight: 8,
          dotWidth: 8,
        ),
        onDotClicked: (index) => controller.animateToPage(index,
            duration: const Duration(microseconds: 500),
            curve: Curves.bounceOut),
      ),
    );
  }
}
