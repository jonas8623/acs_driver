import 'package:uber_ambev_test/data/dtos/ride_dto.dart';

import '../../domain/domain.dart';

abstract class RideEvent {}

class RideInitialEvent extends RideEvent {}

class LoadRideEvent extends RideEvent {}

class SaveRideEvent extends RideEvent {

  final RideEntity ride;

  SaveRideEvent({required this.ride});
}

class UpdateRideEvent extends RideEvent {

  final RideDto editRide;
  UpdateRideEvent({required this.editRide});
}










