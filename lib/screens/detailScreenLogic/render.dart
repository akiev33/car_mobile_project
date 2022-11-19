import 'dart:developer';

import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'RENDER',
            style: GoogleFonts.robotoCondensed(
              textStyle: const TextStyle(
                color: Color(0xff2b4c59),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 18, right: 44),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                child: Image.asset(Images.avatars),
              ),
              const SizedBox(width: 11),
              const Text('Lorem Ipsum'),
              const SizedBox(width: 140),
              GestureDetector(
                onTap: () => log('Message'),
                child: Image.asset(Images.message, scale: 4),
              ),
              const SizedBox(width: 17),
              GestureDetector(
                onTap: () => log('Number'),
                child: Image.asset(Images.called, scale: 4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
