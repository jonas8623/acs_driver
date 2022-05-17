import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uber_ambev_test/domain/entities/passenger_entity.dart';

// ignore: must_be_immutable
class RideEntity extends Equatable{

  int? rideId;
  String? ambevId;
  String? addressOrigin; // Ponto de Partida
  String? cityDestination; // Cidade
  String? dateRide;// data horario da corrida
  List<PassengerEntity>? listPassengers; // Retorna nome dos passageiros
  int? status;
  double? price;
  late int seatAvailable; //  Assentos disponiveis

  RideEntity({
     this.rideId,
     this.ambevId,
     this.addressOrigin,
     this.cityDestination,
     this.dateRide,
     this.listPassengers,
     this.status,
     this.price,
     this.seatAvailable = 3,
  });

  displayNumberOfSeatsAvailable() {
    listPassengers!.length - 3;
  }

  displayColorByNumberOfPassengers() {
    seatAvailable >= 2 ? const Color.fromRGBO(250, 133, 63, 0.9) : Colors.red;
  }

  checkStatus() {
    switch(status) {
      case 1: return "Aberto";
      case 2: return "Concluído";
      default: " ";
    }
  }

  @override
  String toString() {
    return 'RideEntity{rideId: $rideId, ambevId: $ambevId, addressOrigin: $addressOrigin, cityDestination: $cityDestination, dateRide: $dateRide, listPassengers: $listPassengers, status: $status, price: $price, seatAvailable: $seatAvailable}';
  }

  @override
  List<Object?> get props => [rideId];
}