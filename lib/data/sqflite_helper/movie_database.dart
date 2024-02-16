import 'dart:async';
import 'dart:convert';
import 'package:kinopoisk_search/data/db_model/db_movie_model.dart';
import 'package:kinopoisk_search/data/models/movie_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieDatabase {
  static final MovieDatabase instance = MovieDatabase._init();
  static Database? _database;

  MovieDatabase._init();

  Future<Database> initializeDB() async {
    return await _initDB('movie.db');
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('movie.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
     CREATE TABLE movies(
        id INTEGER PRIMARY KEY,
        worldValue INTEGER,
        worldCurrency TEXT,
        ratingImdb REAL,
        ratingFilmCritics REAL,
        ratingRussianFilmCritics REAL,
        votesImdb REAL,
        votesFilmCritics REAL,
        votesRussianFilmCritics REAL,
        backdropUrl TEXT,
        backdropPreviewUrl TEXT,
        name TEXT,
        description TEXT,
        premiereWorld TEXT,
        year INTEGER,
        budgetValue INTEGER,
        budgetCurrency TEXT,
        posterUrl TEXT,
        posterPreviewUrl TEXT,
        genres ARRAY,
        persons ARRAY,
        shortDescription TEXT,
        ageRating INTEGER,
        videosUrl TEXT,
        videosName TEXT
    )'''
    );
  }

  Future<int> insert(DbMovieModel movie) async {
    final db = await instance.database;
    final id = await db.insert('movies', movie.toMap());
    return id;
  }

  Future<DbMovieModel?> readMovie(int id) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return DbMovieModel.fromMap(maps.first);
    }
    return null;
  }

  Future<List<DbMovieModel>> readAllMovies() async {
    final db = await instance.database;
    final orderBy = 'id DESC';
    final List<Map<String, dynamic>> maps = await db.query('movies', orderBy: orderBy);

    List<DbMovieModel> response =  List.generate(maps.length, (i) {
      return DbMovieModel.fromMap(maps[i]);
    });
    return response;
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete('movies', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}