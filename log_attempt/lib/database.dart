import 'package:sqflite/sqflite.dart';

class User {
  final String email;
  final String password;
  final String role;

  User({required this.email, required this.password, required this.role});
}

class DatabaseHelper {
  static const DATABASE_NAME = "auth.db";
  static const TABLE_NAME = "users";
  static const COLUMN_ID = "id";
  static const COLUMN_EMAIL = "email";
  static const COLUMN_PASSWORD = "password";
  static const COLUMN_ROLE = "role";
  static const int DATABASE_VERSION = 1;

  Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }

    _db = await initializeDatabase();
    return _db!;
  }

  Future<Database> initializeDatabase() async {
    final String path = await getDatabasesPath() + '/' + DATABASE_NAME;

    return openDatabase(
      path,
      version: DATABASE_VERSION,
      onCreate: _createDatabase,
      onUpgrade: _onUpgradeDatabase,
    );
  }

  void _createDatabase(Database db, int version) async {
    String createTableQuery = '''
      CREATE TABLE $TABLE_NAME (
        $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $COLUMN_EMAIL TEXT,
        $COLUMN_PASSWORD TEXT,
        $COLUMN_ROLE TEXT
      )
    ''';

    await db.execute(createTableQuery);
  }

  void _onUpgradeDatabase(Database db, int oldVersion, int newVersion) {
    // Implement database upgrade logic here
  }

  // Insert a new user record into the database
  Future<int> insertUser(User user) async {
    Database db = await this.database;
    Map<String, dynamic> map = {
      COLUMN_EMAIL: user.email,
      COLUMN_PASSWORD: user.password,
      COLUMN_ROLE: user.role
    };

    int result = await db.insert(TABLE_NAME, map);

    return result;
  }

  // Authenticate a user with a given email and password
  Future<User?> authenticate(String email, String password) async {
    Database db = await this.database;
    List<Map<String, dynamic>> list = await db.query(TABLE_NAME,
        where: "$COLUMN_EMAIL = ? AND $COLUMN_PASSWORD = ?",
        whereArgs: [email, password]);

    if (list.length > 0) {
      Map<String, dynamic> row = list.first;
      User user = User(
          email: row[COLUMN_EMAIL],
          password: row[COLUMN_PASSWORD],
          role: row[COLUMN_ROLE]);
      return user;
    }

    return null;
  }
}
