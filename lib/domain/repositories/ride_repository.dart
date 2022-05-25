import 'package:uber_ambev_test/data/dtos/ride_dto.dart';
import '../domain.dart';

abstract class RideRepository {

  Future<bool?> save(RideEntity ride);
  Future<List<RideDto>> fetchAll();
  // Future<RaceDTO?> findById(int id);
  Future<int> delete(int id);
  Future update(RideDto ride);

}