// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:adopt_pet_app/models/Weight.dart';
import 'package:adopt_pet_app/models/dog_model/height.dart';
import 'package:adopt_pet_app/models/dog_model/image.dart';

class Dog {
  Weight weight;
  Height height;
  Image image;
  int id;
  String name;
  String breed_for;
  String life_span;
  String temperament;
  String origin;
  String reference_image_id;
  Dog({
    required this.weight,
    required this.height,
    required this.image,
    required this.id,
    required this.name,
    required this.breed_for,
    required this.life_span,
    required this.temperament,
    required this.origin,
    required this.reference_image_id,
  });

  Dog copyWith({
    Weight? weight,
    Height? height,
    Image? image,
    int? id,
    String? name,
    String? breed_for,
    String? life_span,
    String? temperament,
    String? origin,
    String? reference_image_id,
  }) {
    return Dog(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      image: image ?? this.image,
      id: id ?? this.id,
      name: name ?? this.name,
      breed_for: breed_for ?? this.breed_for,
      life_span: life_span ?? this.life_span,
      temperament: temperament ?? this.temperament,
      origin: origin ?? this.origin,
      reference_image_id: reference_image_id ?? this.reference_image_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight': weight.toMap(),
      'height': height.toMap(),
      'image': image.toMap(),
      'id': id,
      'name': name,
      'breed_for': breed_for,
      'life_span': life_span,
      'temperament': temperament,
      'origin': origin,
      'reference_image_id': reference_image_id,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      weight: Weight.fromMap(map['weight'] as Map<String,dynamic>),
      height: Height.fromMap(map['height'] as Map<String,dynamic>),
      image: Image.fromMap(map['image'] as Map<String,dynamic>),
      id: map['id'] as int,
      name: map['name'] as String,
      breed_for: map['breed_for'] as String,
      life_span: map['life_span'] as String,
      temperament: map['temperament'] as String,
      origin: map['origin'] as String,
      reference_image_id: map['reference_image_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dog.fromJson(String source) => Dog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dog(weight: $weight, height: $height, image: $image, id: $id, name: $name, breed_for: $breed_for, life_span: $life_span, temperament: $temperament, origin: $origin, reference_image_id: $reference_image_id)';
  }

  @override
  bool operator ==(covariant Dog other) {
    if (identical(this, other)) return true;
  
    return 
      other.weight == weight &&
      other.height == height &&
      other.image == image &&
      other.id == id &&
      other.name == name &&
      other.breed_for == breed_for &&
      other.life_span == life_span &&
      other.temperament == temperament &&
      other.origin == origin &&
      other.reference_image_id == reference_image_id;
  }

  @override
  int get hashCode {
    return weight.hashCode ^
      height.hashCode ^
      image.hashCode ^
      id.hashCode ^
      name.hashCode ^
      breed_for.hashCode ^
      life_span.hashCode ^
      temperament.hashCode ^
      origin.hashCode ^
      reference_image_id.hashCode;
  }
}
