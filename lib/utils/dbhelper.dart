import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/todo_model.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  final String tableName = "database";
  final String columnId = "id";
  final String columnTask = "tasks";
  final String columnTime = "time";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "database.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }


  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $columnTask TEXT, $columnTime DATE)");
  }

  // Inserting Item
  Future<int> addTask(Task task) async{
    var dbClient = await db;
    return await dbClient.insert("$tableName", task.toMap());
  }

  // Show All Task
  Future<List> allTask() async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName ORDER BY $columnId DESC");
    return result.toList();
  }

  // Show Only One Task
  Future<Task> singleTask(int id) async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName Where $columnId = $id");
    if(result.length == 0) return null;
    return new Task.fromMap(result.first);
  }

  // Count All tasks
  Future<int> countTask() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  // Delete Task
  Future<int> deleteTask(int id) async{
    var dbClient = await db;
    return await dbClient.delete(tableName,
        where: "$columnId = ?", whereArgs: [id]);
  }

  // Update Task
  Future<int> updateTask(Task task) async {
    var dbClient = await db;
    return await dbClient.update(tableName,
        task.toMap(), where: "$columnId = ?", whereArgs: [task.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }


}