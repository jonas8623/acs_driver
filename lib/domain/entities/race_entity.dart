import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RaceEntity extends Equatable{

  int? raceID;
  String? ambevID;
  String? pointOfOrigin;
  String? city; // CIDADE
  String? district; // BAIRRO
  String? createdAt;// data horario da corrida
  String? passengerName; // Retorna nome dos passageiros

  RaceEntity({
     this.raceID,
     this.ambevID,
     this.pointOfOrigin,
     this.city,
     this.district,
     this.createdAt,
     this.passengerName
  });



  @override
  String toString() {
    return 'RaceEntity{raceID: $raceID, ambevID: $ambevID, pointOfOrigin: $pointOfOrigin, city: $city, district: $district, createdAt: $createdAt, passengerName: $passengerName}';
  }

  @override
  List<Object?> get props => [raceID];
}