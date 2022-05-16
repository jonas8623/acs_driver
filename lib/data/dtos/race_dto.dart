import 'package:uber_ambev_test/domain/entities/entities.dart';

import '../data_constant.dart';

// ignore: must_be_immutable
class RaceDTO extends RaceEntity {

  int? raceIDDTO;
  String? ambevIDDTO;
  String? pointOfOriginDTO;
  String? cityDTO;
  String? districtDTO;
  //int? accentsAvailableDTO;
  String? dateDTO;
  String? hourDTO;
  String? createAtDTO;
  String? passengerNameDTO;

  RaceDTO({
      this.raceIDDTO,
      this.ambevIDDTO,
      this.pointOfOriginDTO,
      this.cityDTO,
      this.districtDTO,
      this.createAtDTO,
      this.passengerNameDTO
  }) : super(
    raceID: raceIDDTO,
    // ambevID: ambevIDDTO,
    pointOfOrigin: pointOfOriginDTO,
    city: cityDTO,
    district: districtDTO,
    createdAt: createAtDTO,
    passengerName: passengerNameDTO
  );

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      // 'ambevID': ambevIDDTO,
      'pointOfOrigin': pointOfOriginDTO,
      'city': cityDTO,
      'district': districtDTO,
      'createdAt': createAtDTO,
      'passengerName': passengerNameDTO
    };
    if(raceIDDTO != null) {
      map['raceID'] = raceIDDTO;
    }
    return map;
  }

  RaceDTO.fromMap(Map map) {
   raceIDDTO = map[raceColumnID] ?? 0;
   ambevIDDTO = map[raceColumnAmbev];
   pointOfOriginDTO = map[raceColumnPointOfOrigin];
   cityDTO = map[raceColumnCity];
   districtDTO = map[raceColumnDistrict];
   //accentsAvailableDTO = map['accentsAvailable'];
   createAtDTO = map[raceColumnCreateAt];
   passengerNameDTO = map[raceColumnPassengerName];
  }
}