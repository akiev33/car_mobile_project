import 'package:car_mobile_project/cubit/cubit.dart';
import 'package:car_mobile_project/resources/resources.dart';
import 'package:car_mobile_project/screens/addCar.dart';
import 'package:car_mobile_project/screens/detailScreen.dart';
import 'package:car_mobile_project/screens/mainScreenLogic/selectType.dart';
import 'package:car_mobile_project/screens/profile.dart';
import 'package:car_mobile_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mainScreenLogic/carsItem.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scrollController = ScrollController(initialScrollOffset: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 65.h,
        width: 65.w,
        child: FloatingActionButton(
          backgroundColor: AppColors.color2B4C59,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCar(
                  currentLength: context.read<CarCubit>().cars.length,
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              icon: Image.asset(Images.menuButtonProfile, scale: 4),
            ),
            Text(
              'Profile',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: AppColors.color000000,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        color: AppColors.colorFFFFFF,
        child: CustomScrollView(
          slivers: [
            BlocBuilder<CarCubit, CarState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is SuccessState) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SelectWidget(),
                          SizedBox(height: 35.h),
                          Text(
                            'Cars Available Near You',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 27.h),
                          GridView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 27,
                              crossAxisSpacing: 34,
                            ),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      model: state.car[index],
                                    ),
                                  ),
                                );
                              },
                              child: CarsItem(
                                model: state.car[index],
                              ),
                            ),
                            itemCount: state.car.length,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (state is ErrorState) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text('An error has occurred!'),
                    ),
                  );
                }
                return const SliverFillRemaining(
                  child: Center(
                    child: Text('Data not loaded'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
