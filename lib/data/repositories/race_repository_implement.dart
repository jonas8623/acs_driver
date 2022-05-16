import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uber_ambev_test/data/dtos/race_dto.dart';
import 'package:uber_ambev_test/domain/entities/entities.dart';
import 'package:uber_ambev_test/domain/repositories/repositories.dart';
import '../data_constant.dart';

class RaceRepositoryImplement implements RaceRepository {

  late RaceDTO race;

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
  Future<List<RaceDTO>> fetchAll() async {
    try {
      final Database database = await _initializeDB();
      List<Map<String, dynamic>> query = await database.query(raceTableName, orderBy: '$raceColumnCreateAt ASC');

      return List.generate(query.length, (index) {
        // log('FetchALL COM SUCESSO');
        return RaceDTO.fromMap(query[index]);
      });
    } catch(e) {
      return [];
    }
  }

  @override
    Future save(RaceEntity race) async {
      try {
        final Database database = await _initializeDB();

        race.raceID = await database.rawInsert('''
          INSERT INTO $raceTableName(
                $raceColumnAmbev,
                $raceColumnPointOfOrigin,
                $raceColumnCity,
                $raceColumnDistrict,
                $raceColumnCreateAt,
                $raceColumnPassengerName
          )
          VALUES(
             '${race.ambevID}',
             '${race.pointOfOrigin}',
             '${race.city}',
             '${race.district}',
             '${race.createdAt}',
             '${race.passengerName}'
          )
        ''');
        // log('Salvo com Sucesso');
      } catch(error) {
        return;
      }
    }

  @override
  Future update(RaceDTO race) async {
    final Database database = await _initializeDB();
    return await database.update(
        raceTableName,
        race.toMap(),
        where: "$raceColumnID = ?",
        whereArgs: [race.raceIDDTO]
    );
  }
}
