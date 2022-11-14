import 'package:car_mobile_project/resources/resources.dart';
import 'package:car_mobile_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.carScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 256.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.h),
              child: SizedBox(
                height: 60.h,
                width: 145.w,
                child: Image.asset(Images.titleInMainScreen),
              ),
            ),
            SizedBox(height: 332.h),
            SizedBox(
              height: 35.h,
              child: Text(
                'Rent your dream car from the',
                style: GoogleFonts.hind(
                  textStyle: TextStyle(
                    color: AppColors.hindF6F6F6.withOpacity(0.81),
                    fontWeight: FontWeight.w600,
                    fontSize: 28.sp,
                  ),
                ),
              ),
            ),
            Text(
              'Best Company',
              textAlign: TextAlign.center,
              style: GoogleFonts.hind(
                textStyle: TextStyle(
                  color: AppColors.hindF6F6F6.withOpacity(0.81),
                  fontWeight: FontWeight.w600,
                  fontSize: 30.sp,
                ),
              ),
            ),
            SizedBox(height: 67.h),
            SizedBox(
              height: 55.h,
              width: 260.w, //243
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
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 21.sp,
                          color: AppColors.hindFFFFFF,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
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
      ),
    );
  }
}
