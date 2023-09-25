import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: '''CREATE TABLE Tarefas ( 
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      descricao TEXT,
      concluido INTEGER
      )'''
};

class SQLiteDatabase {
  static Database? db;

  Future<Database> obterDataBase() async {
    if (db == null) {
      return await iniciarBancoDados();
    } else {
      return db!;
    }
  }

  Future<Database> iniciarBancoDados() async {
    var db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length,
      onCreate: (db, version) async {
        for (var i = 1; i <= scripts.length; i++) {
          db.execute(scripts[i]!);
          print(scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          db.execute(scripts[i]!);
          print(scripts[i]!);
        }
      },
    );
    return db;
  }
}
