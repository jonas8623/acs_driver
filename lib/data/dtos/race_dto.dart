import '../../domain/domain.dart';
import '../data_constant.dart';

// ignore: must_be_immutable
class RideDTO extends RideEntity {

  int? rideIdDTO;
  String? ambevIdDTO;
  String? addressOriginDTO;
  String? cityDestinationDTO;
  String? dateDTO;
  double? priceDTO;
  // String? hourDTO;
  int? statusDTO;
  List<PassengerEntity>? listPassengersDTO;
  int? seatAvailableDTO;

  RideDTO({
      this.rideIdDTO,
      this.ambevIdDTO,
      this.addressOriginDTO,
      this.cityDestinationDTO,
      this.dateDTO,
      this.priceDTO,
      this.listPassengersDTO,
      this.statusDTO,
      this.seatAvailableDTO,
  }) : super(
    rideId: rideIdDTO,
    ambevId: ambevIdDTO,
    addressOrigin: addressOriginDTO,
    cityDestination: cityDestinationDTO,
    dateRide: dateDTO,
    listPassengers: listPassengersDTO,
    price: priceDTO,
    seatAvailable: seatAvailableDTO!,
  );

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      // 'ambevID': ambevIDDTO,
      'pointOfOrigin': addressOriginDTO,
      'city': cityDestinationDTO,
      'district': districtDTO,
      'createdAt': statusDTO,
      'passengerName': listPassengersDTO
    };
    if(rideIdDTO != null) {
      map['raceID'] = rideIdDTO;
    }
    return map;
  }

  RideDTO.fromMap(Map map) {
   rideIdDTO = map[raceColumnID] ?? 0;
   ambevIdDTO = map[raceColumnAmbev];
   addressOriginDTO = map[raceColumnPointOfOrigin];
   cityDestinationDTO = map[raceColumnCity];
   districtDTO = map[raceColumnDistrict];
   //accentsAvailableDTO = map['accentsAvailable'];
   statusDTO = map[raceColumnCreateAt];
   listPassengersDTO = map[raceColumnPassengerName];
  }
}