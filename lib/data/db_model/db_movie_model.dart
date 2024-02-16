import 'dart:convert';

class DbMovieModel {
  DbMovieModel({
    required this.worldValue,
    required this.worldCurrency,
    required this.ratingImdb,
    required this.ratingFilmCritics,
    required this.ratingRussianFilmCritics,
    required this.votesImdb,
    required this.votesFilmCritics,
    required this.votesRussianFilmCritics,
    required this.backdropUrl,
    required this.backdropPreviewUrl,
    required this.id,
    required this.name,
    required this.description,
    required this.premiereWorld,
    required this.year,
    required this.budgetValue,
    required this.budgetCurrency,
    required this.posterUrl,
    required this.posterPreviewUrl,
    required this.genres,
    required this.persons,
    required this.shortDescription,
    required this.ageRating,
  required this.videosUrl,
  required this.videosName,
});
late final int worldValue;
late final String worldCurrency;
late final double ratingImdb;
late final double ratingFilmCritics;
late final double ratingRussianFilmCritics;
late final double votesImdb;
late final double votesFilmCritics;
late final double votesRussianFilmCritics;
late final String backdropUrl;
late final String backdropPreviewUrl;
late final int id;
late final String name;
late final String description;
late final String premiereWorld;
late final int year;
late final int budgetValue;
late final String budgetCurrency;
late final String posterUrl;
late final String posterPreviewUrl;
late final List<String> genres;
late final List<Map<String, String>> persons;
late final String shortDescription;
late final int ageRating;
late final String videosUrl;
late final String videosName;

  // Convert DbMovieModel instance to a map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'worldValue': worldValue,
      'worldCurrency': worldCurrency,
      'ratingImdb': ratingImdb,
      'ratingFilmCritics': ratingFilmCritics,
      'ratingRussianFilmCritics': ratingRussianFilmCritics,
      'votesImdb': votesImdb,
      'votesFilmCritics': votesFilmCritics,
      'votesRussianFilmCritics': votesRussianFilmCritics,
      'backdropUrl': backdropUrl,
      'backdropPreviewUrl': backdropPreviewUrl,
      'name': name,
      'description': description,
      'premiereWorld': premiereWorld,
      'year': year,
      'budgetValue': budgetValue,
      'budgetCurrency': budgetCurrency,
      'posterUrl': posterUrl,
      'posterPreviewUrl': posterPreviewUrl,
      'genres': genres.join(','), // Convert list to comma-separated string
      'persons': jsonEncode(persons), // Serialize list of maps to JSON string
      'shortDescription': shortDescription,
      'ageRating': ageRating,
      'videosUrl': videosUrl,
      'videosName': videosName,
    };
  }

  // Convert map from database to DbMovieModel instance
  factory DbMovieModel.fromMap(Map<String, dynamic> map) {
    List<Map<String, String>> jsonStringToMapList(String jsonString) {
      List<Map<String, String>> mapList = [];

      // Parse the JSON string into a dynamic object
      List<dynamic> jsonList = json.decode(jsonString);

      // Iterate over the dynamic object and convert each entry into a Map<String, String>
      for (var entry in jsonList) {
        // Assuming each entry is a single key-value pair
        String key = entry.keys.first;
        String value = entry.values.first;
        mapList.add({key: value});
      }

      return mapList;
    }

    return DbMovieModel(
      worldValue: map['worldValue'],
      worldCurrency: map['worldCurrency'],
      ratingImdb: map['ratingImdb'],
      ratingFilmCritics: map['ratingFilmCritics'],
      ratingRussianFilmCritics: map['ratingRussianFilmCritics'],
      votesImdb: map['votesImdb'],
      votesFilmCritics: map['votesFilmCritics'],
      votesRussianFilmCritics: map['votesRussianFilmCritics'],
      backdropUrl: map['backdropUrl'],
      backdropPreviewUrl: map['backdropPreviewUrl'],
      id: map['id'],
      name: map['name'],
      description: map['description'],
      premiereWorld: map['premiereWorld'],
      year: map['year'],
      budgetValue: map['budgetValue'],
      budgetCurrency: map['budgetCurrency'],
      posterUrl: map['posterUrl'],
      posterPreviewUrl: map['posterPreviewUrl'],
      genres: map['genres'].split(','), // Convert comma-separated string to list
      persons: jsonStringToMapList(map['persons']), // Deserialize JSON string to list of maps
      shortDescription: map['shortDescription'],
      ageRating: map['ageRating'],
      videosUrl: map['videosUrl'],
      videosName: map['videosName'],
    );
  }
}