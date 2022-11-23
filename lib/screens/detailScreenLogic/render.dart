import 'dart:developer';

import 'package:car_mobile_project/resources/Rental_icons.dart';
import 'package:car_mobile_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/resources.dart';

class RenderItem extends StatelessWidget {
  const RenderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Text(
            'RENDER',
            style: GoogleFonts.robotoCondensed(
              textStyle: TextStyle(
                color: AppColors.color2B4C59,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w, top: 18.h, right: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Image.asset(Images.avatars),
                  ),
                  SizedBox(width: 11.w),
                  const Text('Lorem Ipsum'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      log('message');
                    },
                    icon: Icon(Rental.vector,
                        size: 32, color: AppColors.color988080),
                  ),
                  IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      log('phone');
                    },
                    icon: Icon(
                      Rental.vector_1,
                      size: 32,
                      color: AppColors.color2B4C59,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
