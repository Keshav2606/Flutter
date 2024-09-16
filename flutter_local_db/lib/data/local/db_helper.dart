// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // To make the constructor Private.
  DBHelper._();

  static DBHelper getInstance() {
    return DBHelper._();
  }

  Database? myDB;
  static const String NOTES_TABLE = "notes";
  static const int NOTES_COL_ID = 0;
  static const String NOTES_COL_TITLE = "title";
  static const String NOTES_COL_DESCRIPTION = "description";

  Future<Database> getDB() async {
    myDB = myDB ?? await openDB();
    return myDB!;
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    String dbPath = join(appDir.path, "notes_db.db");

    return await openDatabase(dbPath, onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE $NOTES_TABLE ($NOTES_COL_ID integer primary key autoincrement, $NOTES_COL_TITLE varchar(100) not null, $NOTES_COL_DESCRIPTION varchar(5000))");
    }, version: 1);
  }

  Future<bool> addNotes(
      {required String noteTitle, required String noteDescription}) async {
    var db = await getDB();

    int rowsEffected = await db.insert(NOTES_TABLE, {
      NOTES_COL_TITLE: noteTitle,
      NOTES_COL_DESCRIPTION: noteDescription,
    });

    return rowsEffected > 0;
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();

    List<Map<String, dynamic>> allNotes = await db.query(NOTES_TABLE);

    return allNotes;
  }

  Future<bool> updateNotes(
      {required String noteTitle,
      required String noteDescription,
      required String id}) async {
    var db = await getDB();

    int rowsEffected = await db.update(
        NOTES_TABLE,
        {
          NOTES_COL_TITLE: noteTitle,
          NOTES_COL_DESCRIPTION: noteDescription,
        },
        where: "$NOTES_COL_ID = $id");

    return rowsEffected > 0;
  }

  Future<bool> deleteNotes({required int id}) async {
    var db = await getDB();

    int rowsEffected = await db
        .delete(NOTES_TABLE, where: "$NOTES_COL_ID = ?", whereArgs: [id]);

    return rowsEffected > 0;
  }
}
