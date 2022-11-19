import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/car_model.dart';
import '../../theme/colors.dart';

class Information extends StatefulWidget {
  const Information({super.key, required this.counter, required this.model});

  final int counter;
  final Car model;

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.model.nameCar,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            '\$${(widget.model.price * widget.counter).toString()}.00',
            style: GoogleFonts.ptSans(
              textStyle: TextStyle(color: AppColors.colorC64949),
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
