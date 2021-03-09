import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "relief_translations_database.db";
  static final _databaseVersion = 1;

  static final translationsTable = 'translations';

  static final columnEn = 'en';
  static final columnRo = 'ro';
  static final columnTag = 'tag';
  static final columnId = 'id';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future _onCreate(Database db, int version) async {
    await db
        .execute('''CREATE TABLE $translationsTable($columnId TEXT PRIMARY KEY,
        $columnEn TEXT NOT NULL,$columnRo TEXT NOT NULL,
        $columnTag TEXT NOT NULL)''');
  }

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }
}
