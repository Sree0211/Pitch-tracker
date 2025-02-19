import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/match_model.dart';

class MatchProvider extends ChangeNotifier {
  List<MatchModel> _matches = [];
  Database? _database;

  List<MatchModel> get matches => _matches;

  MatchProvider() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    try {
      final path = join(await getDatabasesPath(), 'matches.db');
      _database = await openDatabase(
        path,
        version: 2, // Increased version to trigger migration
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE matches (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, date TEXT, opponent TEXT, formation TEXT)",
          );
        },
        onUpgrade: (db, oldVersion, newVersion) {
          if (oldVersion < 2) {
            db.execute(
              "ALTER TABLE matches ADD COLUMN opponent TEXT DEFAULT ''",
            );
            db.execute(
              "ALTER TABLE matches ADD COLUMN formation TEXT DEFAULT ''",
            );
          }
        },
      );
      await _loadMatches();
    } catch (e) {
      debugPrint("Database Initialization Error: $e");
    }
  }

  Future<void> _loadMatches() async {
    if (_database == null) return;
    final List<Map<String, dynamic>> maps = await _database!.query('matches');
    _matches = maps.map((m) => MatchModel.fromJson(m)).toList();
    notifyListeners();
  }

  Future<void> addMatch(String name, String opponent, String formation) async {
    if (_database == null) return;
    int id = await _database!.insert('matches', {
      'name': name,
      'date': DateTime.now().toIso8601String(),
      'opponent': opponent,
      'formation': formation,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    _matches.add(
      MatchModel(
        id: id,
        name: name,
        date: DateTime.now().toString(),
        opponent: opponent,
        formation: formation,
      ),
    );
    notifyListeners();
  }

  Future<void> deleteMatch(int id) async {
    if (_database == null) return;
    await _database!.delete('matches', where: "id = ?", whereArgs: [id]);
    _matches.removeWhere((match) => match.id == id);
    notifyListeners();
  }
}
