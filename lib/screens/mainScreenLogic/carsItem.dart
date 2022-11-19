import 'package:car_mobile_project/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resources/resources.dart';
import '../../theme/colors.dart';

class CarsItem extends StatelessWidget {
  const CarsItem({super.key, required this.model});

  final Car model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 155,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            color: AppColors.roboto000000.withOpacity(0.25),
            blurRadius: 4,
          ),
        ],
        color: model.color,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Image.asset(
              model.image,
              height: 85,
              width: double.infinity,
            ),
            SizedBox(
              width: 89,
              height: 17,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
                child: Text(
                  model.nameCar.toUpperCase(),
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: AppColors.ptSans2B4C59,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 66,
              height: 16,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.contain,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${model.price}',
                        style: GoogleFonts.ptSans(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '/day',
                        style: GoogleFonts.ptSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: AppColors.roboto000000.withOpacity(0.30),
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
                const SizedBox(width: 7),
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
