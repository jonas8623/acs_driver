import '../../domain/domain.dart';

abstract class RideEvent {}

class RaceInitialEvent extends RideEvent {}

class LoadRaceEvent extends RideEvent {}

class SaveRaceEvent extends RideEvent {

  final RideEntity race;

  SaveRaceEvent({required this.race});
}










