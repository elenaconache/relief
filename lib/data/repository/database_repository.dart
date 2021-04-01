import 'dart:async';

import 'package:relief/data/database_helper.dart';
import 'package:relief/data/model/translation.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepository {
  DatabaseRepository();

  Future<void> insertTranslations(List<Translation> translations) async {
    final Database db = await DatabaseHelper.instance.database;
    Batch batch = db.batch();
    translations.forEach((element) {
      batch.insert(DatabaseHelper.translationsTable, element.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });

    await batch.commit(continueOnError: true);
  }

  Future<List<Translation>> getTranslations() async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps =
        await db.query(DatabaseHelper.translationsTable);
    var list = List.generate(maps.length, (i) {
      return Translation.fromJson(maps[i]);
    });
    return list;
  }
}
