import 'package:uber_ambev_test/domain/entities/entities.dart';

abstract class RaceEvent {}

class RaceInitialEvent extends RaceEvent {}

class LoadRaceEvent extends RaceEvent {}

class SaveRaceEvent extends RaceEvent {

  final RaceEntity race;

  SaveRaceEvent({required this.race});
}










