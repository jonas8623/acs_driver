import 'package:uber_ambev_test/data/dtos/race_dto.dart';

abstract class RaceState {}

class RaceInitialState extends RaceState {}

class RegisterMessageState extends RaceState {

  final String message;
  RegisterMessageState({required this.message});
}

class LoadingRaceState extends RaceState {}

class MessageSaveSuccessState extends RaceState {

  final String message;
  MessageSaveSuccessState({required this.message});
}

class MessageErrorState extends RaceState {

  final String message;
  MessageErrorState({required this.message});
}

class MessageListEmptyState extends RaceState {

  final String message;
  MessageListEmptyState({required this.message});
}

class ListLoadSuccessState extends RaceState {

  final List<RaceDTO>? races;
  ListLoadSuccessState(this.races);
}









