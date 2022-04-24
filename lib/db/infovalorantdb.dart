import 'package:infovalorant/model/watch.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class InfoValorantDB {
  static final InfoValorantDB instance = InfoValorantDB._init();

  static Database? _database;

  InfoValorantDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('infovalorant.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE $tableWatchTrailer (
      ${WatchTrailerFields.id} $idType,
      ${WatchTrailerFields.image} $textType,
      ${WatchTrailerFields.title} $textType,
      ${WatchTrailerFields.desc} $textType,
      ${WatchTrailerFields.number} $textType,
      ${WatchTrailerFields.url} $textType)''');
  }
  

  Future<WatchTrailerModel> create(WatchTrailerModel trailer) async {
    final db = await instance.database;
    final id = await db.insert(tableWatchTrailer, trailer.toJson());

    return trailer.copy(id: id);
  }
  

  Future<WatchTrailerModel> read(int id) async {
    final db = await instance.database;
    final map = await db.query(tableWatchTrailer,
        columns: WatchTrailerFields.values,
        where: '${WatchTrailerFields.id} = ?',
        whereArgs: [id]);

    if (map.isNotEmpty) {
      return WatchTrailerModel.fromJson(map.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<WatchTrailerModel>> readAllTrailer() async {
    final db = await instance.database;

    final result = await db.query(tableWatchTrailer);

    return result.map((json) => WatchTrailerModel.fromJson(json)).toList();
  }

  Future<int> update(WatchTrailerModel trailer) async {
    final db = await instance.database;

    return db.update(tableWatchTrailer, trailer.toJson(),
        where: '${WatchTrailerFields.id} = ?', whereArgs: [trailer.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(tableWatchTrailer,
        where: '${WatchTrailerFields.id} = ?', whereArgs: [id]);
  }

  Future deleteAll() async{
    final db = await instance.database;
    return await db.delete(tableWatchTrailer);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
