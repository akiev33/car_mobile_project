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

class _SelectWidgetState extends State<SelectWidget>
    with TickerProviderStateMixin {
  final List<String> _types = [
    'All',
    'family cars',
    'Cheap cars',
    'Luxuly cars',
  ];

  late final AnimationController _controller;
  late final AnimationController _fieldController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1))
        ..forward();
  late final Animation<Offset> _animation;
  late final Animation<Offset> _fieldAnimation =
      Tween<Offset>(begin: const Offset(1.1, 0.0), end: const Offset(2.0, 0.0))
          .animate(_fieldController);

  final FocusNode _focusnode = FocusNode();

  bool isActive = false;
  int currentIndex = 0;

  @override
  void initState() {
    _focusnode.addListener(() {
      if (!_focusnode.hasFocus) {
        _controller.reverse();
        _fieldController.forward();
        _focusnode.unfocus();
      } else {
        _controller.forward();
        _fieldController.reverse();
        _focusnode.requestFocus();
      }
    });
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(-1.1, 0.0))
        .animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 28.h,
          width: 295.w,
          child: SlideTransition(
            position: _animation,
            child: Stack(
              children: [
                ListView.separated(
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
                        context
                            .read<CarCubit>()
                            .sortCars(type: TypeInCar.familyCars);
                      }
                      if (_types[index] == 'Cheap cars') {
                        context
                            .read<CarCubit>()
                            .sortCars(type: TypeInCar.cheapCars);
                      }
                      if (_types[index] == 'Luxuly cars') {
                        context
                            .read<CarCubit>()
                            .sortCars(type: TypeInCar.luxulyCars);
                      }
                      setState(() {});
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 22.w),
                  itemCount: _types.length,
                ),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: SlideTransition(
                    position: _fieldAnimation,
                    child: TextField(
                      focusNode: _focusnode,
                      onChanged: (value) {
                        BlocProvider.of<CarCubit>(context)
                            .searchCars(name: value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          splashRadius: 22,
          onPressed: () async {
            if (_controller.isCompleted) {
              _controller.reverse();
              _fieldController.forward();
              _focusnode.unfocus();
            } else {
              _controller.forward();
              _fieldController.reverse();
              _focusnode.requestFocus();
            }
          },
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
