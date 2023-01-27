// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:adopt_pet_app/models/Weight.dart';

class Cat {
  Weight weight;
  String id;
  String name;
  String cfa_url;
  String vetstreet_url;
  String vcahospitals_url;
  String temperament;
  String origin;
  String country_codes;
  String country_code;
  String description;
  String life_span;
  int indoor;
  int lap;
  String alt_names;
  int adaptability;
  int affection_level;
  int child_friendly;
  int dog_friendly;
  int energy_level;
  int grooming;
  int health_issues;
  int intelligence;
  int shedding_level;
  int social_needs;
  int stranger_friendly;
  int vocalisation;
  int experimental;
  int hairless;
  int natural;
  int rare;
  int rex;
  int suppressed_tail;
  int short_legs;
  String wikipedia_url;
  int hypoallergenic;
  String reference_image_id;
  Cat({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfa_url,
    required this.vetstreet_url,
    required this.vcahospitals_url,
    required this.temperament,
    required this.origin,
    required this.country_codes,
    required this.country_code,
    required this.description,
    required this.life_span,
    required this.indoor,
    required this.lap,
    required this.alt_names,
    required this.adaptability,
    required this.affection_level,
    required this.child_friendly,
    required this.dog_friendly,
    required this.energy_level,
    required this.grooming,
    required this.health_issues,
    required this.intelligence,
    required this.shedding_level,
    required this.social_needs,
    required this.stranger_friendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressed_tail,
    required this.short_legs,
    required this.wikipedia_url,
    required this.hypoallergenic,
    required this.reference_image_id,
  });
  

  Cat copyWith({
    Weight? weight,
    String? id,
    String? name,
    String? cfa_url,
    String? vetstreet_url,
    String? vcahospitals_url,
    String? temperament,
    String? origin,
    String? country_codes,
    String? country_code,
    String? description,
    String? life_span,
    int? indoor,
    int? lap,
    String? alt_names,
    int? adaptability,
    int? affection_level,
    int? child_friendly,
    int? dog_friendly,
    int? energy_level,
    int? grooming,
    int? health_issues,
    int? intelligence,
    int? shedding_level,
    int? social_needs,
    int? stranger_friendly,
    int? vocalisation,
    int? experimental,
    int? hairless,
    int? natural,
    int? rare,
    int? rex,
    int? suppressed_tail,
    int? short_legs,
    String? wikipedia_url,
    int? hypoallergenic,
    String? reference_image_id,
  }) {
    return Cat(
      weight: weight ?? this.weight,
      id: id ?? this.id,
      name: name ?? this.name,
      cfa_url: cfa_url ?? this.cfa_url,
      vetstreet_url: vetstreet_url ?? this.vetstreet_url,
      vcahospitals_url: vcahospitals_url ?? this.vcahospitals_url,
      temperament: temperament ?? this.temperament,
      origin: origin ?? this.origin,
      country_codes: country_codes ?? this.country_codes,
      country_code: country_code ?? this.country_code,
      description: description ?? this.description,
      life_span: life_span ?? this.life_span,
      indoor: indoor ?? this.indoor,
      lap: lap ?? this.lap,
      alt_names: alt_names ?? this.alt_names,
      adaptability: adaptability ?? this.adaptability,
      affection_level: affection_level ?? this.affection_level,
      child_friendly: child_friendly ?? this.child_friendly,
      dog_friendly: dog_friendly ?? this.dog_friendly,
      energy_level: energy_level ?? this.energy_level,
      grooming: grooming ?? this.grooming,
      health_issues: health_issues ?? this.health_issues,
      intelligence: intelligence ?? this.intelligence,
      shedding_level: shedding_level ?? this.shedding_level,
      social_needs: social_needs ?? this.social_needs,
      stranger_friendly: stranger_friendly ?? this.stranger_friendly,
      vocalisation: vocalisation ?? this.vocalisation,
      experimental: experimental ?? this.experimental,
      hairless: hairless ?? this.hairless,
      natural: natural ?? this.natural,
      rare: rare ?? this.rare,
      rex: rex ?? this.rex,
      suppressed_tail: suppressed_tail ?? this.suppressed_tail,
      short_legs: short_legs ?? this.short_legs,
      wikipedia_url: wikipedia_url ?? this.wikipedia_url,
      hypoallergenic: hypoallergenic ?? this.hypoallergenic,
      reference_image_id: reference_image_id ?? this.reference_image_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight': weight.toMap(),
      'id': id,
      'name': name,
      'cfa_url': cfa_url,
      'vetstreet_url': vetstreet_url,
      'vcahospitals_url': vcahospitals_url,
      'temperament': temperament,
      'origin': origin,
      'country_codes': country_codes,
      'country_code': country_code,
      'description': description,
      'life_span': life_span,
      'indoor': indoor,
      'lap': lap,
      'alt_names': alt_names,
      'adaptability': adaptability,
      'affection_level': affection_level,
      'child_friendly': child_friendly,
      'dog_friendly': dog_friendly,
      'energy_level': energy_level,
      'grooming': grooming,
      'health_issues': health_issues,
      'intelligence': intelligence,
      'shedding_level': shedding_level,
      'social_needs': social_needs,
      'stranger_friendly': stranger_friendly,
      'vocalisation': vocalisation,
      'experimental': experimental,
      'hairless': hairless,
      'natural': natural,
      'rare': rare,
      'rex': rex,
      'suppressed_tail': suppressed_tail,
      'short_legs': short_legs,
      'wikipedia_url': wikipedia_url,
      'hypoallergenic': hypoallergenic,
      'reference_image_id': reference_image_id,
    };
  }

  factory Cat.fromMap(Map<String, dynamic> map) {
    return Cat(
      weight: Weight.fromMap(map['weight'] as Map<String,dynamic>),
      id: map['id'] as String,
      name: map['name'] as String,
      cfa_url: map['cfa_url'] as String,
      vetstreet_url: map['vetstreet_url'] as String,
      vcahospitals_url: map['vcahospitals_url'] as String,
      temperament: map['temperament'] as String,
      origin: map['origin'] as String,
      country_codes: map['country_codes'] as String,
      country_code: map['country_code'] as String,
      description: map['description'] as String,
      life_span: map['life_span'] as String,
      indoor: map['indoor'] as int,
      lap: map['lap'] as int,
      alt_names: map['alt_names'] as String,
      adaptability: map['adaptability'] as int,
      affection_level: map['affection_level'] as int,
      child_friendly: map['child_friendly'] as int,
      dog_friendly: map['dog_friendly'] as int,
      energy_level: map['energy_level'] as int,
      grooming: map['grooming'] as int,
      health_issues: map['health_issues'] as int,
      intelligence: map['intelligence'] as int,
      shedding_level: map['shedding_level'] as int,
      social_needs: map['social_needs'] as int,
      stranger_friendly: map['stranger_friendly'] as int,
      vocalisation: map['vocalisation'] as int,
      experimental: map['experimental'] as int,
      hairless: map['hairless'] as int,
      natural: map['natural'] as int,
      rare: map['rare'] as int,
      rex: map['rex'] as int,
      suppressed_tail: map['suppressed_tail'] as int,
      short_legs: map['short_legs'] as int,
      wikipedia_url: map['wikipedia_url'] as String,
      hypoallergenic: map['hypoallergenic'] as int,
      reference_image_id: map['reference_image_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cat.fromJson(String source) => Cat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cat(weight: $weight, id: $id, name: $name, cfa_url: $cfa_url, vetstreet_url: $vetstreet_url, vcahospitals_url: $vcahospitals_url, temperament: $temperament, origin: $origin, country_codes: $country_codes, country_code: $country_code, description: $description, life_span: $life_span, indoor: $indoor, lap: $lap, alt_names: $alt_names, adaptability: $adaptability, affection_level: $affection_level, child_friendly: $child_friendly, dog_friendly: $dog_friendly, energy_level: $energy_level, grooming: $grooming, health_issues: $health_issues, intelligence: $intelligence, shedding_level: $shedding_level, social_needs: $social_needs, stranger_friendly: $stranger_friendly, vocalisation: $vocalisation, experimental: $experimental, hairless: $hairless, natural: $natural, rare: $rare, rex: $rex, suppressed_tail: $suppressed_tail, short_legs: $short_legs, wikipedia_url: $wikipedia_url, hypoallergenic: $hypoallergenic, reference_image_id: $reference_image_id)';
  }

  @override
  bool operator ==(covariant Cat other) {
    if (identical(this, other)) return true;
  
    return 
      other.weight == weight &&
      other.id == id &&
      other.name == name &&
      other.cfa_url == cfa_url &&
      other.vetstreet_url == vetstreet_url &&
      other.vcahospitals_url == vcahospitals_url &&
      other.temperament == temperament &&
      other.origin == origin &&
      other.country_codes == country_codes &&
      other.country_code == country_code &&
      other.description == description &&
      other.life_span == life_span &&
      other.indoor == indoor &&
      other.lap == lap &&
      other.alt_names == alt_names &&
      other.adaptability == adaptability &&
      other.affection_level == affection_level &&
      other.child_friendly == child_friendly &&
      other.dog_friendly == dog_friendly &&
      other.energy_level == energy_level &&
      other.grooming == grooming &&
      other.health_issues == health_issues &&
      other.intelligence == intelligence &&
      other.shedding_level == shedding_level &&
      other.social_needs == social_needs &&
      other.stranger_friendly == stranger_friendly &&
      other.vocalisation == vocalisation &&
      other.experimental == experimental &&
      other.hairless == hairless &&
      other.natural == natural &&
      other.rare == rare &&
      other.rex == rex &&
      other.suppressed_tail == suppressed_tail &&
      other.short_legs == short_legs &&
      other.wikipedia_url == wikipedia_url &&
      other.hypoallergenic == hypoallergenic &&
      other.reference_image_id == reference_image_id;
  }

  @override
  int get hashCode {
    return weight.hashCode ^
      id.hashCode ^
      name.hashCode ^
      cfa_url.hashCode ^
      vetstreet_url.hashCode ^
      vcahospitals_url.hashCode ^
      temperament.hashCode ^
      origin.hashCode ^
      country_codes.hashCode ^
      country_code.hashCode ^
      description.hashCode ^
      life_span.hashCode ^
      indoor.hashCode ^
      lap.hashCode ^
      alt_names.hashCode ^
      adaptability.hashCode ^
      affection_level.hashCode ^
      child_friendly.hashCode ^
      dog_friendly.hashCode ^
      energy_level.hashCode ^
      grooming.hashCode ^
      health_issues.hashCode ^
      intelligence.hashCode ^
      shedding_level.hashCode ^
      social_needs.hashCode ^
      stranger_friendly.hashCode ^
      vocalisation.hashCode ^
      experimental.hashCode ^
      hairless.hashCode ^
      natural.hashCode ^
      rare.hashCode ^
      rex.hashCode ^
      suppressed_tail.hashCode ^
      short_legs.hashCode ^
      wikipedia_url.hashCode ^
      hypoallergenic.hashCode ^
      reference_image_id.hashCode;
  }
}
