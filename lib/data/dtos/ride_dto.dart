import '../../domain/domain.dart';
import '../data_constant/data_constant.dart';

// ignore: must_be_immutable
class RideDto extends RideEntity {

  int? rideIdDto;
  String? ambevIdDto;
  String? addressOriginDto;
  String? cityDestinationDto;
  String? addressDestinationDto;
  String? dateDto;
  String? listPassengersDto;
  int? statusDto;
  double? priceDto;
  int? seatAvailableDto;

  RideDto({
      this.rideIdDto,
      this.ambevIdDto,
      this.addressOriginDto,
      this.cityDestinationDto,
      this.addressDestinationDto,
      this.dateDto,
      this.listPassengersDto,
      // this.statusDTO,
      // this.priceDTO,
      // this.seatAvailableDTO,
  }) : super(
    rideId: rideIdDto,
    ambevId: ambevIdDto,
    addressOrigin: addressOriginDto,
    cityDestination: cityDestinationDto,
    addressDestination: addressDestinationDto,
    dateRide: dateDto,
    listPassengers: listPassengersDto,
    // status: statusDTO,
    // price: priceDTO,
    // seatAvailable: seatAvailableDTO,
  );

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      'ambevId': ambevIdDto,
      'addressOrigin': addressOriginDto,
      'cityDestination': cityDestinationDto,
      'addressDestination': addressDestinationDto,
      'dateRide': dateDto,
      'listPassengers': listPassengersDto,
      // 'status': statusDTO,
      // 'price': priceDTO,
      // 'seatAvailable': seatAvailableDTO
    };
    if(rideIdDto != null) {
      map['rideId'] = rideIdDto;
    }
    return map;
  }

  RideDto.fromMap(Map map) {
   rideIdDto = map[rideColumnId] ?? 0;
   ambevIdDto = map[rideColumnAmbev];
   addressOriginDto = map[rideColumnAddressOrigin];
   cityDestinationDto = map[rideColumnCityDestination];
   addressDestinationDto = map[rideColumnAddressDestination];
   dateDto = map[rideColumnDate];
   listPassengersDto = map[rideColumnPassengerName];
   // statusDto = map[rideColumnStatus];
   // priceDto = map[rideColumnPrice];
   // seatAvailableDTO = map[rideColumnSeatAvailable];
  }
}