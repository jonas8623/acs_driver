import 'package:uber_ambev_test/data/dtos/ride_dto.dart';

abstract class RideState {}

class RideInitialState extends RideState {}

class MessageRegistrationSuccessfulState extends RideState {

  final String message;
  MessageRegistrationSuccessfulState({required this.message});
}

class LoadingRideState extends RideState {}

class UnsuccessfulMessageRegistrationState extends RideState {

  final String message;
  UnsuccessfulMessageRegistrationState({required this.message});
}

class ErrorMessageState extends RideState {

  final String message;
  ErrorMessageState({required this.message});
}

class MessageListEmptyState extends RideState {

  final String message;
  MessageListEmptyState({required this.message});
}

class ListLoadSuccessState extends RideState {

  final List<RideDto>? listRides;
  ListLoadSuccessState(this.listRides);
}

class RideMessageUpdatedSuccess extends RideState {

  final String? message;
  RideMessageUpdatedSuccess(this.message);
}

class MessageUpdatedUnsuccessfulState extends RideState {

  final String message;
  MessageUpdatedUnsuccessfulState(this.message);
}









