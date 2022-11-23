import 'package:car_mobile_project/cubit/cubit.dart';
import 'package:car_mobile_project/resources/resources.dart';
import 'package:car_mobile_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/car_model.dart' as model;

class AddCar extends StatefulWidget {
  const AddCar({super.key, required this.currentLength});

  final int currentLength;

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  late final _carMark = TextEditingController();
  late final _carModel = TextEditingController();
  late final _carEngine = TextEditingController();
  late final _carYear = TextEditingController();
  late final _price = TextEditingController();
  late final _carTransition = TextEditingController();
  late final _speed = TextEditingController();

  List<model.Transition> transition = [
    model.Transition.automatic,
    model.Transition.mechanics,
  ];

  model.Transition currentTransition = model.Transition.automatic;

  List<model.TypeInCar> typeCar = [
    model.TypeInCar.cheapCars,
    model.TypeInCar.familyCars,
    model.TypeInCar.luxulyCars,
  ];

  model.TypeInCar currentType = model.TypeInCar.familyCars;

  @override
  void dispose() {
    _carMark.dispose();
    _carModel.dispose();
    _carYear.dispose();
    _carEngine.dispose();
    _price.dispose();
    _carTransition.dispose();
    _speed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          splashRadius: 1,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            Images.vectorBack,
            scale: 4,
          ),
        ),
        leadingWidth: 95.w,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                'Add car',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 37.h),
              Text(
                'Car mark:',
                style: GoogleFonts.ptSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: AppColors.color2B4C59,
                  ),
                ),
              ),
              TextField(
                maxLength: 40,
                decoration:
                    const InputDecoration(counterText: '', hintText: 'Toyota'),
                controller: _carMark,
              ),
              SizedBox(height: 20.h),
              Text(
                'Car model:',
                style: GoogleFonts.ptSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: AppColors.color2B4C59,
                  ),
                ),
              ),
              TextField(
                maxLength: 30,
                decoration: const InputDecoration(
                  counterText: '',
                  hintText: 'Chaser Tourer V',
                ),
                controller: _carModel,
              ),
              SizedBox(height: 20.h),
              Text(
                'Car year:',
                style: GoogleFonts.ptSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: AppColors.color2B4C59,
                  ),
                ),
              ),
              TextField(
                maxLength: 4,
                decoration: const InputDecoration(
                  counterText: '',
                  hintText: '1999',
                ),
                controller: _carYear,
              ),
              SizedBox(height: 20.h),
              Text(
                'Car engine volume:',
                style: GoogleFonts.ptSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: AppColors.color2B4C59,
                  ),
                ),
              ),
              TextField(
                maxLength: 7,
                decoration: const InputDecoration(
                  counterText: '',
                  hintText: '2.5 / electro',
                ),
                controller: _carEngine,
              ),
              SizedBox(height: 20.h),
              Text(
                'Speed(km/h):',
                style: GoogleFonts.ptSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: AppColors.color2B4C59,
                  ),
                ),
              ),
              TextField(
                maxLength: 4,
                decoration: const InputDecoration(
                  counterText: '',
                  hintText: '240 km/h',
                ),
                controller: _speed,
              ),
              SizedBox(height: 20.h),
              Text(
                'Car price:',
                style: GoogleFonts.ptSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: AppColors.color2B4C59,
                  ),
                ),
              ),
              TextField(
                maxLength: 10,
                decoration: const InputDecoration(
                  counterText: '',
                  hintText: '20 000\$',
                ),
                controller: _price,
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
                    onChanged: (v) {
                      currentTransition = v!;
                      setState(() {});
                    },
                    value: currentTransition,
                    items: transition
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                  ),
                  DropdownButton(
                    onChanged: (v) {
                      currentType = v!;
                      setState(() {});
                    },
                    value: currentType,
                    items: typeCar
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () {
                    final newModel = model.Car(
                        id: widget.currentLength + 1,
                        image: Images.range,
                        nameCar: _carMark.text,
                        price: int.tryParse(_price.text) ?? 0,
                        transition: currentTransition,
                        speed: int.tryParse(_speed.text) ?? 0,
                        modelCar: _carModel.text,
                        engineValue: _carEngine.text,
                        yearCar: int.tryParse(_carYear.text) ?? 0,
                        type: [currentType]);
                    BlocProvider.of<CarCubit>(context)
                        .createCar(newCar: newModel);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.color2B4C59,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Center(
                    child: Text(
                      'Add Car',
                      style: GoogleFonts.inconsolata(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
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
      ),
    );
  }
}
