import 'package:car_mobile_project/theme/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle hindW600Size26 = TextStyle(
    color: AppColors.hindF6F6F6.withOpacity(0.81),
    fontWeight: FontWeight.w600,
    fontSize: 26,
  );
  static TextStyle hindW800Size20 = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: AppColors.hindFFFFFF,
  );
}
