import 'dart:developer';

import 'package:car_mobile_project/screens/detailScreenLogic/pageViewIndicator.dart';
import 'package:car_mobile_project/screens/detailScreenLogic/priceAndNameCar.dart';
import 'package:car_mobile_project/screens/detailScreenLogic/render.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/car_model.dart';
import 'containerInDetail.dart';

class MainDetail extends StatefulWidget {
  const MainDetail({super.key, required this.model});

  final Car model;

  @override
  State<MainDetail> createState() => _MainDetailState();
}

class _MainDetailState extends State<MainDetail> {
  int counter = 1;
  final controller = PageController(viewportFraction: 0.5);

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 330,
          decoration: BoxDecoration(
            color: widget.model.color,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
          child: Image.asset(widget.model.image),
        ),
        const SizedBox(height: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Information(model: widget.model, counter: counter),
            const SizedBox(height: 40),
            SizedBox(
              height: 130,
              child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        color: const Color(0xff000000).withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: ContainerInDetail(index: index, model: widget.model),
                ),
                itemCount: 6,
              ),
            ),
            const SizedBox(height: 21),
            IndicatorOnPageView(controller: controller),
            const SizedBox(height: 13),
            const RenderItem(),
            const SizedBox(height: 37),
            Padding(
              padding: const EdgeInsets.only(left: 37),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (counter < 10000) {
                        counter++;
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 43,
                      width: 43,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff95BCCC),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xff95BCCC),
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Text(
                    counter.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      if (counter > 1) {
                        counter--;
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 43,
                      width: 43,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff95BCCC)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Icon(Icons.remove, color: Color(0xff95BCCC)),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Container(
                    width: 180,
                    height: 52,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xff000000),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => log('book now'),
                        child: Text(
                          'BOOK NOW',
                          style: GoogleFonts.imprima(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
