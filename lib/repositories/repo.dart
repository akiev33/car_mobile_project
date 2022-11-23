import 'package:car_mobile_project/model/car_model.dart';
import 'package:car_mobile_project/resources/resources.dart';
import 'package:flutter/material.dart';

class CarRepo {
  List<Car> getCar() {
    return cars;
  }
}

List<Car> cars = [
  Car(
    id: 1,
    image: Images.toyotaCamry,
    nameCar: 'TOYOTA',
    price: 300,
    color: const Color(0xffCCBDBD),
    transition: Transition.automatic,
    speed: 200,
    modelCar: 'Camry 70',
    engineValue: '3.5',
    yearCar: 2015,
    type: [TypeInCar.familyCars],
  ),
  Car(
      id: 2,
      image: Images.lambo,
      nameCar: 'LAMBORGHINI',
      price: 550,
      color: const Color(0xffF6F6F6),
      transition: Transition.automatic,
      speed: 350,
      modelCar: 'Ghoust',
      engineValue: '5.0',
      yearCar: 2018,
      type: [TypeInCar.luxulyCars]),
  Car(
    id: 3,
    image: Images.range,
    nameCar: 'RANGE ROVER',
    price: 150,
    color: const Color(0xffFCC21B),
    transition: Transition.automatic,
    speed: 280,
    modelCar: 'Lineup Luxury',
    engineValue: '4.5',
    yearCar: 2010,
    type: [TypeInCar.familyCars],
  ),
  Car(
    id: 4,
    image: Images.range2,
    nameCar: 'RANGE ROVER',
    price: 250,
    color: const Color(0xffBECEDA),
    transition: Transition.automatic,
    speed: 260,
    modelCar: 'Deluxe 7B',
    engineValue: '4.0',
    yearCar: 2011,
    type: [TypeInCar.familyCars],
  ),
  Car(
    id: 5,
    image: Images.tesla,
    nameCar: 'TESLA',
    price: 150,
    color: const Color(0xffF8F8F8),
    transition: Transition.automatic,
    speed: 250,
    modelCar: 'Model X',
    engineValue: 'electro',
    yearCar: 2018,
    type: [TypeInCar.cheapCars, TypeInCar.familyCars],
  ),
  Car(
    id: 5,
    image: Images.lambo2,
    nameCar: 'LAMBORGHINI',
    price: 280,
    color: const Color(0xffFFFFFF),
    transition: Transition.automatic,
    speed: 300,
    modelCar: 'Aventodor',
    engineValue: '3.5',
    yearCar: 2009,
    type: [TypeInCar.luxulyCars],
  ),
];
