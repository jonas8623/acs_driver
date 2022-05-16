const String dataBaseName = 'race.db';

const String raceTableName = 'raceTable';
const String raceColumnID = 'raceColumnID';
const String raceColumnAmbev = 'raceColumnAmbevID';
const String raceColumnPointOfOrigin = 'raceColumnDeparturePointTheRace';
const String raceColumnCity = 'raceColumnCity';
const String raceColumnDistrict = 'raceColumnDistrict';
const String raceColumnCreateAt = 'raceCreateAt';
// const String raceColumnDate = 'raceColumnDate';
// const String raceColumnHour = 'raceColumnHour';
const String raceColumnPassengerName = 'raceColumnPassengerName';

const String createTableRace = '''
  CREATE TABLE $raceTableName(
    $raceColumnID INTEGER PRIMARY KEY,
    $raceColumnAmbev TEXT,
    $raceColumnPointOfOrigin TEXT,
    $raceColumnCity TEXT,
    $raceColumnDistrict TEXT,
    $raceColumnCreateAt TEXT,
    $raceColumnPassengerName TEXT
  )
''';