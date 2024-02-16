import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kinopoisk_search/data/db_model/db_movie_model.dart';

class FirebaseHelper {

  static final FirebaseFirestore _db = FirebaseFirestore.instance;



  static Future<String> saveMovie(DbMovieModel dbMovieModel) async{

    Map<String, dynamic> movieData = {
    'id': dbMovieModel.id,
    'worldValue': dbMovieModel.worldValue,
    'worldCurrency': dbMovieModel.worldCurrency,
    'ratingImdb': dbMovieModel.ratingImdb,
    'ratingFilmCritics': dbMovieModel.ratingFilmCritics,
    'ratingRussianFilmCritics': dbMovieModel.ratingRussianFilmCritics,
    'votesImdb': dbMovieModel.votesImdb,
    'votesFilmCritics': dbMovieModel.votesFilmCritics,
    'votesRussianFilmCritics': dbMovieModel.votesRussianFilmCritics,
    'backdropUrl': dbMovieModel.backdropUrl,
    'backdropPreviewUrl': dbMovieModel.backdropPreviewUrl,
    'name': dbMovieModel.name,
    'description': dbMovieModel.description,
    'premiereWorld': dbMovieModel.premiereWorld,
    'year': dbMovieModel.year,
    'budgetValue': dbMovieModel.budgetValue,
    'budgetCurrency': dbMovieModel.budgetCurrency,
    'posterUrl': dbMovieModel.posterUrl,
    'posterPreviewUrl': dbMovieModel.posterPreviewUrl,
    'genres': dbMovieModel.genres, // Convert list to comma-separated string
    'persons': dbMovieModel.persons, // Serialize list of maps to JSON string
    'shortDescription': dbMovieModel.shortDescription,
    'ageRating': dbMovieModel.ageRating,
    'videosUrl': dbMovieModel.videosUrl,
    'videosName': dbMovieModel.videosName,
    };

    DocumentReference docRef = _db.collection('movie_history').doc();

    await docRef.set(movieData);
    // Set the data
    return docRef.id; // Return the auto-generated ID
  }

  static Future<bool> deleteMovie(String movieID,) async{
      final clientsRef = _db.collection('movie_history').doc(movieID);
      if((await clientsRef.get()).exists) {
        await clientsRef.delete();
        return true;
      }
      else{
        print('id is not exist');
        return false;
      }
    }
}