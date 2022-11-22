import 'package:car_mobile_project/model/car_model.dart';

import 'package:car_mobile_project/screens/mainScreenLogic/selectItem.dart';
import 'package:car_mobile_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/cubit.dart';
import '../../resources/Rental_icons.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget({super.key});

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  final List<String> _types = [
    'All',
    'family cars',
    'Cheap cars',
    'Luxuly cars',
  ];

  bool isActive = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 28.h,
          width: 295.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SelectItem(
              text: _types[index],
              isActive: currentIndex == index,
              onTap: () {
                currentIndex = index;
                if (_types[index] == 'All') {
                  context.read<CarCubit>().getAllCars();
                }
                if (_types[index] == 'family cars') {
                  context.read<CarCubit>().sortCars(type: TypeInCar.familyCars);
                }
                if (_types[index] == 'Cheap cars') {
                  context.read<CarCubit>().sortCars(type: TypeInCar.cheapCars);
                }
                if (_types[index] == 'Luxuly cars') {
                  context.read<CarCubit>().sortCars(type: TypeInCar.luxulyCars);
                }
                setState(() {});
              },
            ),
            separatorBuilder: (context, index) => SizedBox(width: 22.w),
            itemCount: _types.length,
          ),
        ),
        IconButton(
          splashRadius: 22,
          onPressed: () {},
          icon: Icon(
            Rental.epSearch,
            size: 30,
            color: AppColors.color988080,
          ),
        ),
      ],
    );
  }
}
