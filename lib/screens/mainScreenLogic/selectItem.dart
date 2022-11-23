// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/colors.dart';

// ignore: must_be_immutable
class SelectItem extends StatelessWidget {
  SelectItem({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 83.w,
        decoration: BoxDecoration(
            color: isActive ? AppColors.color2B4C59 : AppColors.colorFFFFFF,
            border: Border.all(color: AppColors.color2B4C59),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.ptSans(
              textStyle: TextStyle(
                color: isActive ? AppColors.colorFFFFFF : AppColors.color000000,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
