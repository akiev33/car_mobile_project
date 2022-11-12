import 'package:car_mobile_project/resources/resources.dart';
import 'package:car_mobile_project/theme/colors.dart';
import 'package:car_mobile_project/theme/text_font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(Images.carScreen),
          Column(
            children: [
              const SizedBox(height: 240),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: SizedBox(
                  height: 60,
                  width: 145,
                  child: Image.asset(Images.titleInMainScreen),
                ),
              ),
              const SizedBox(height: 340),
              Text(
                'Rent your dream car from the\nBest Company',
                textAlign: TextAlign.center,
                style: GoogleFonts.hind(
                  textStyle: AppTextStyle.hindW600Size26,
                ),
              ),
              const SizedBox(height: 70),
              SizedBox(
                height: 55,
                width: 245, //243
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.inconsolataC64949),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: GoogleFonts.inconsolata(
                          textStyle: AppTextStyle.hindW800Size20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        Images.vector,
                        scale: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
