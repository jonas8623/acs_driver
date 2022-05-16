import 'package:uber_ambev_test/data/dtos/race_dto.dart';
import 'package:uber_ambev_test/domain/entities/entities.dart';

abstract class RaceRepository {

  Future save(RaceEntity race);
  Future<List<RaceDTO>> fetchAll();
  // Future<RaceDTO?> findById(int id);
  Future<int> delete(int id);
  Future update(RaceDTO race);

}