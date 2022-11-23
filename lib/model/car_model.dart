// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

enum TypeInCar {
  familyCars,
  cheapCars,
  luxulyCars,
}

enum Transition {
  automatic,
  mechanics,
}

class Car {
  final int id;
  final String image;
  final String nameCar;
  final int price;
  final Color color;
  final Transition transition;
  final int speed;
  final String modelCar;
  String engineValue = '';
  final int yearCar;
  final List<TypeInCar> type;

  Car({
    required this.id,
    required this.image,
    required this.nameCar,
    required this.price,
    this.color = Colors.white,
    required this.transition,
    required this.speed,
    required this.modelCar,
    required this.engineValue,
    required this.yearCar,
    required this.type,
  });

  Car copyWith({
    int? id,
    String? image,
    String? nameCar,
    int? price,
    Color? color,
    Transition? transition,
    int? speed,
    String? modelCar,
    String? engineValue,
    int? yearCar,
    List<TypeInCar>? type,
  }) {
    return Car(
      id: id ?? this.id,
      image: image ?? this.image,
      nameCar: nameCar ?? this.nameCar,
      price: price ?? this.price,
      color: color ?? this.color,
      transition: transition ?? this.transition,
      speed: speed ?? this.speed,
      modelCar: modelCar ?? this.modelCar,
      engineValue: engineValue ?? this.engineValue,
      yearCar: yearCar ?? this.yearCar,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'nameCar': nameCar,
      'price': price,
      'color': color.value,
      'transition': transition,
      'speed': speed,
      'modelCar': modelCar,
      'engineValue': engineValue,
      'yearCar': yearCar,
      'type': type,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Car(id: $id, image: $image, nameCar: $nameCar, price: $price, color: $color, transition: $transition, speed: $speed, modelCar: $modelCar, engineValue: $engineValue, yearCar: $yearCar, type: $type)';
  }

  @override
  bool operator ==(covariant Car other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.nameCar == nameCar &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ image.hashCode ^ nameCar.hashCode ^ price.hashCode;
  }
}
