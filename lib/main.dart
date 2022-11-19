import 'package:car_mobile_project/cubit/cubit.dart';
import 'package:car_mobile_project/repositories/repo.dart';
import 'package:car_mobile_project/screens/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CarRepo(),
      child: BlocProvider(
        create: (context) =>
            CarCubit(repo: context.read<CarRepo>())..getAllCars(),
        child: ScreenUtilInit(
          designSize: const Size(430.0, 932.0),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LoadingScreen(),
            );
          },
        ),
      ),
    );
  }
}
