import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uber_ambev_test/data/dtos/race_dto.dart';
import 'package:uber_ambev_test/domain/repositories/repositories.dart';
import '../data_constant.dart';

class RideRepositoryImplement implements RideRepository {

  late RideDTO race;

  Future<Database> _initializeDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dataBaseName);

     //await deleteDatabase(path);
    // log('Deletado com sucesso');
    
    return openDatabase(path, version: 1,
      onCreate: (Database database, int newVersion) async {
        await database.execute(
            createTableRace
          // "CREATE TABLE raceTable(${race.raceIDDTO} INTEGER PRIMARY KEY, ${race.ambevIDDTO} TEXT, ${race.cityDTO} TEXT, ${race.districtDTO} TEXT, ${race.dateDTO} TEXT, ${race.hourDTO} TEXT, ${race.createAtDTO} TEXT, ${race.passengerName})"
        );
      }
    );
  }
  
  @override
  Future<int> delete(int id) async {
    final Database database = await _initializeDB();
    return await database.delete(
        raceTableName,
        where: "$raceColumnID = ?",
        whereArgs: [id]
    );
  }

  @override
  Future<List<RideDTO>> fetchAll() async {
    try {
      final Database database = await _initializeDB();
      List<Map<String, dynamic>> query = await database.query(raceTableName, orderBy: '$raceColumnCreateAt ASC');

      return List.generate(query.length, (index) {
        // log('FetchALL COM SUCESSO');
        return RideDTO.fromMap(query[index]);
      });
    } catch(e) {
      return [];
    }
  }

  @override
    Future<bool?> save(RideEntity race) async {
      try {
        final Database database = await _initializeDB();

        race.rideId = await database.rawInsert('''
          INSERT INTO $raceTableName(
                $raceColumnAmbev,
                $raceColumnPointOfOrigin,
                $raceColumnCity,
                $raceColumnDistrict,
                $raceColumnCreateAt,
                $raceColumnPassengerName
          )
          VALUES(
             '${race.ambevId}',
             '${race.pointOfOrigin}',
             '${race.cityDestination}',
             '${race.district}',
             '${race.dateRide}',
             '${race.listPassengers}'
          )
        ''');
        return true;
      } catch(error) {
        return false;
      }
    }

  @override
  Future update(RideDTO race) async {
    final Database database = await _initializeDB();
    return await database.update(
        raceTableName,
        race.toMap(),
        where: "$raceColumnID = ?",
        whereArgs: [race.rideIdDTO]
    );
  }
}
