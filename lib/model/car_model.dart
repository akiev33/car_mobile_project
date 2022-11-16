// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Car {
  final int id;
  final String image;
  final String nameCar;
  final int price;
  Car({
    required this.id,
    required this.image,
    required this.nameCar,
    required this.price,
  });

  Car copyWith({
    int? id,
    String? image,
    String? nameCar,
    int? price,
  }) {
    return Car(
      id: id ?? this.id,
      image: image ?? this.image,
      nameCar: nameCar ?? this.nameCar,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'nameCar': nameCar,
      'price': price,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'] as int,
      image: map['image'] as String,
      nameCar: map['nameCar'] as String,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Car(id: $id, image: $image, nameCar: $nameCar, price: $price)';
  }

  @override
  bool operator ==(covariant Car other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.image == image &&
      other.nameCar == nameCar &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      image.hashCode ^
      nameCar.hashCode ^
      price.hashCode;
  }
}
