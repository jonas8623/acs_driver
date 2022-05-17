import 'package:uber_ambev_test/data/dtos/race_dto.dart';
import '../domain.dart';

abstract class RideRepository {

  Future<bool?> save(RideEntity race);
  Future<List<RideDTO>> fetchAll();
  // Future<RaceDTO?> findById(int id);
  Future<int> delete(int id);
  Future update(RideDTO race);

}