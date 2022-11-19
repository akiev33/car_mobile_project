import 'package:car_mobile_project/model/car_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:car_mobile_project/repositories/repo.dart';



class CarCubit extends Cubit<CarState> {
  CarCubit({required this.repo}) : super(InitialState());
  final CarRepo repo;

  Future<void> getAllCars() async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(SuccessState(car: repo.getCar()));
  }
}

abstract class CarState {}

class InitialState extends CarState {}

class LoadingState extends CarState {}

class SuccessState extends CarState {
  List<Car> car;
  SuccessState({required this.car});
}

class ErrorState extends CarState {}
