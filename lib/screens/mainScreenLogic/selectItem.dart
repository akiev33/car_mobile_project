// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        width: 83,
        decoration: BoxDecoration(
            color: isActive ? const Color(0xff2B4C59) : Colors.white,
            border: Border.all(color: const Color(0xff2B4C59)),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.ptSans(
              textStyle: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
