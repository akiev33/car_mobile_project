import 'package:car_mobile_project/cubit/cubit.dart';
import 'package:car_mobile_project/resources/resources.dart';
import 'package:car_mobile_project/screens/detailScreen.dart';
import 'package:car_mobile_project/screens/mainScreenLogic/selectType.dart';
import 'package:car_mobile_project/screens/profile.dart';
import 'package:car_mobile_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mainScreenLogic/carsItem.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  color: AppColors.roboto000000,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomScrollView(
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SelectWidget(),
                        const SizedBox(height: 35),
                        Text(
                          'Cars Available Near You',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 27),
                        GridView.builder(
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
              return const SliverFillRemaining(
                child: Center(
                  child: Text('Error'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
