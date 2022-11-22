import 'dart:developer';

import 'package:car_mobile_project/screens/detailScreenLogic/pageViewIndicator.dart';
import 'package:car_mobile_project/screens/detailScreenLogic/priceAndNameCar.dart';
import 'package:car_mobile_project/screens/detailScreenLogic/render.dart';
import 'package:car_mobile_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          height: 330.h,
          decoration: BoxDecoration(
            color: widget.model.color,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
          child: Image.asset(
            widget.model.image,
            width: double.infinity,
          ),
        ),
        SizedBox(height: 32.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Information(model: widget.model, counter: counter),
            SizedBox(height: 40.h),
            SizedBox(
              height: 120.h,
              child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.colorF6F6F6,
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        color: AppColors.color000000.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: ContainerInDetail(index: index, model: widget.model),
                ),
                itemCount: 6,
              ),
            ),
            SizedBox(height: 21.h),
            IndicatorOnPageView(controller: controller),
            SizedBox(height: 13.h),
            const RenderItem(),
            SizedBox(height: 37.h),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (counter < 10000) {
                        counter++;
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 43.h,
                      width: 43.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.colors95BCCC,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 25,
                        color: AppColors.colors95BCCC,
                      ),
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Text(
                    counter.toString(),
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 9.w),
                  GestureDetector(
                    onTap: () {
                      if (counter > 1) {
                        counter--;
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 43.h,
                      width: 43.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.colors95BCCC),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Icon(Icons.remove,
                          size: 25, color: AppColors.colors95BCCC),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  SizedBox(
                    width: 180.w,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () {
                        log('book now');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.color000000,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Center(
                        child: Text(
                          'BOOK NOW',
                          style: GoogleFonts.imprima(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                              color: AppColors.colorFFFFFF,
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
