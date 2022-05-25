import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uber_ambev_test/data/dtos/ride_dto.dart';
import '../../domain/domain.dart';
import '../data_constant/data_constant.dart';

class RideRepositoryImplement implements RideRepository {
  late RideDto ride;

  Future<Database> _initializeDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "ride.db");

     //await deleteDatabase(path);
    //log("Deletado com sucesso");

    return openDatabase(path, version: 1,
        onCreate: (Database database, int newVersion) async {
      await database.execute(
          "CREATE TABLE $rideTableName($rideColumnId INTEGER PRIMARY KEY, $rideColumnAmbev TEXT, $rideColumnAddressOrigin TEXT, $rideColumnCityDestination TEXT, $rideColumnAddressDestination TEXT, $rideColumnDate TEXT, $rideColumnPassengerName TEXT, $rideColumnStatus INTEGER, $rideColumnPrice REAL)");
    });
  }

  @override
  Future<int> delete(int id) async {
    final Database database = await _initializeDB();
    return await database.delete(rideTableName, where: "$rideColumnId = ?", whereArgs: [id]);
  }

  @override
  Future<List<RideDto>> fetchAll() async {
    try {
      final Database database = await _initializeDB();
      final List<Map<String, dynamic>> listRices = await database.query(rideTableName, orderBy: '$rideColumnDate ASC',);
      return List.generate(listRices.length, (index) {
        return RideDto.fromMap(listRices[index]);
      });
    } catch(e) {
      return List.empty();
    }
  }

  @override
  Future<bool?> save(RideEntity ride) async {
    try {
      final Database database = await _initializeDB();
      ride.rideId = await database.rawInsert('''INSERT INTO $rideTableName(
        $rideColumnAmbev, $rideColumnAddressOrigin, $rideColumnCityDestination,
        $rideColumnAddressDestination, $rideColumnDate, $rideColumnPassengerName,
        $rideColumnStatus, $rideColumnPrice)
        VALUES(
          '${ride.ambevId}','${ride.addressOrigin}','${ride.cityDestination}',
          '${ride.addressDestination}','${ride.dateRide}','${ride.listPassengers}',
          '${ride.status}','${ride.price}'
        )
        '''
      );
      return true;
    } catch(error) {
      return false;
    }
  }

  @override
  Future<int> update(RideDto ride) async {
    final Database database = await _initializeDB();
    return await database.update(rideTableName, ride.toMap(),
        where: "$rideColumnId = ?", whereArgs: [ride.rideIdDto]);
  }
}
