import 'package:car_mobile_project/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resources/resources.dart';
import '../../theme/colors.dart';

class CarsItem extends StatelessWidget {
  const CarsItem({super.key, required this.model});

  final Car model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: 155.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            color: AppColors.color000000.withOpacity(0.25),
            blurRadius: 4,
          ),
        ],
        color: model.color,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Image.asset(
              model.image,
              height: 85.h,
              width: double.infinity,
            ),
            SizedBox(
              width: 89.w,
              height: 17.h,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
                child: Text(
                  model.nameCar.toUpperCase(),
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: AppColors.color2B4C59,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.h),
            SizedBox(
              width: 66.w,
              height: 16.h,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${model.price}',
                        style: GoogleFonts.ptSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '/day',
                        style: GoogleFonts.ptSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: AppColors.color000000.withOpacity(0.30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    Images.iconsHeart,
                    scale: 4,
                  ),
                ),
                SizedBox(width: 7.w),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    Images.arrowDownCircleFill,
                    scale: 4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
