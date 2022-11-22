import 'package:car_mobile_project/model/car_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:car_mobile_project/repositories/repo.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit({required this.repo}) : super(InitialState());
  final CarRepo repo;
  List<Car> cars = [];
  List<Car> filteredCars = [];

  Future<void> getAllCars() async {
    emit(LoadingState());
    await Future.delayed(const Duration(milliseconds: 500));
    cars = repo.getCar();
    filteredCars = repo.getCar();
    emit(SuccessState(car: filteredCars));
  }

  Future<void> createCar({required Car newCar}) async {
    cars.add(newCar);
    filteredCars = cars;
    emit(SuccessState(car: filteredCars));
  }

  Future<void> sortCars({required TypeInCar type}) async {
    // emit(LoadingState());
    // await Future.delayed(const Duration(milliseconds: 500));
    List<Car> tempList = [];
    for (var e in cars) {
      if (e.type.any((element) => element == type)) {
        tempList.add(e);
      }
    }
    filteredCars = tempList;
    emit(SuccessState(car: filteredCars));
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
