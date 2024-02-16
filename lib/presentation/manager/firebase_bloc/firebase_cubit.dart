import 'package:bloc/bloc.dart';
import 'package:kinopoisk_search/data/db_model/db_movie_model.dart';
import 'package:kinopoisk_search/data/firebase_helper/firebase_helper.dart';
import 'package:meta/meta.dart';

part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit() : super(FirebaseInitial());

  Future<String> saveNewMovie(DbMovieModel dbMovieModel) async{
    emit(FirebaseLoading());
    var id = await FirebaseHelper.saveMovie(
        dbMovieModel
    );
    emit(FirebaseAdded());
    return id;
  }

  Future<String> addLocalMovies(DbMovieModel dbMovieModel) async{
    var id = await FirebaseHelper.saveMovie(
        dbMovieModel
    );
    return id;
  }

  Future<bool> deleteLocalMovies(String movieID) async{
    final response = await FirebaseHelper.deleteMovie(movieID);
    return response;
  }

  Future<bool> deleteFirebaseMovieHistory(String movieID,) async{
    emit(FirebaseLoading());
    final response = await FirebaseHelper.deleteMovie(movieID);
    emit(FirebaseDeleted());
    return response;
  }
}
