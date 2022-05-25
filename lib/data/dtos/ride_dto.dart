import '../../domain/domain.dart';
import '../data_constant.dart';

// ignore: must_be_immutable
class RideDto extends RideEntity {

  int? rideIdDTO;
  String? ambevIdDTO;
  String? addressOriginDTO;
  String? cityDestinationDTO;
  String? addressDestinationDTO;
  String? dateDTO;
  String? listPassengersDTO;
  int? statusDTO;
  double? priceDTO;
  // String? hourDTO;
  int? seatAvailableDTO;

  RideDto({
      this.rideIdDTO,
      this.ambevIdDTO,
      this.addressOriginDTO,
      this.cityDestinationDTO,
      this.addressDestinationDTO,
      this.dateDTO,
      this.listPassengersDTO,
      // this.statusDTO,
      // this.priceDTO,
      // this.seatAvailableDTO,
  }) : super(
    rideId: rideIdDTO,
    ambevId: ambevIdDTO,
    addressOrigin: addressOriginDTO,
    cityDestination: cityDestinationDTO,
    addressDestination: addressDestinationDTO,
    dateRide: dateDTO,
    listPassengers: listPassengersDTO,
    // status: statusDTO,
    // price: priceDTO,
    // seatAvailable: seatAvailableDTO,
  );

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      'ambevId': ambevIdDTO,
      'addressOrigin': addressOriginDTO,
      'cityDestination': cityDestinationDTO,
      'addressDestination': addressDestinationDTO,
      'dateRide': dateDTO,
      'listPassengers': listPassengersDTO,
      // 'status': statusDTO,
      // 'price': priceDTO,
      // 'seatAvailable': seatAvailableDTO
    };
    if(rideIdDTO != null) {
      map['rideId'] = rideIdDTO;
    }
    return map;
  }

  RideDto.fromMap(Map map) {
   rideIdDTO = map[rideColumnId] ?? 0;
   ambevIdDTO = map[rideColumnAmbev];
   addressOriginDTO = map[rideColumnAddressOrigin];
   cityDestinationDTO = map[rideColumnCityDestination];
   addressDestinationDTO = map[rideColumnAddressDestination];
   dateDTO = map[rideColumnDate];
   listPassengersDTO = map[rideColumnPassengerName];
   // statusDTO = map[rideColumnStatus];
   // priceDTO = map[rideColumnPrice];
   // seatAvailableDTO = map[rideColumnSeatAvailable];
  }
}