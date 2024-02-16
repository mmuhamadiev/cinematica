import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kinopoisk_search/data/db_model/db_movie_model.dart';
import 'package:kinopoisk_search/generated/assets.dart';
import 'package:kinopoisk_search/presentation/manager/firebase_bloc/firebase_cubit.dart';
import 'package:kinopoisk_search/presentation/manager/movie_bloc/movie_bloc.dart';
import 'package:kinopoisk_search/presentation/pages/favourite/manager/favourite_cubit.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void compareDatabases() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('movie_history')
        .get();

    final allMoviesList = await getMoviesFromLocalDb();
    List<DbMovieModel> firebaseMoviesList = [];
    if (querySnapshot.docs.isNotEmpty) {
      // Assuming there is only one document with the given username and password
      querySnapshot.docs.forEach((documentSnapshot) {
        // Extracting data

        List<String> genres = [];
        documentSnapshot['genres'].forEach((element) {
          genres.add(element);
        });

        List<Map<String, String>> persons = [];
        documentSnapshot['persons'].forEach((element) {
          element.forEach((key, value) {
            persons.add({
              key: value
            });
          });
        });

        DbMovieModel dbMovieModel = DbMovieModel(
          worldValue: documentSnapshot['worldValue'],
          worldCurrency: documentSnapshot['worldCurrency'],
          ratingImdb: documentSnapshot['ratingImdb'],
          ratingFilmCritics: documentSnapshot['ratingFilmCritics'],
          ratingRussianFilmCritics: documentSnapshot['ratingRussianFilmCritics'],
          votesImdb: documentSnapshot['votesImdb'],
          votesFilmCritics: documentSnapshot['votesFilmCritics'],
          votesRussianFilmCritics: documentSnapshot['votesRussianFilmCritics'],
          backdropUrl: documentSnapshot['backdropUrl'],
          backdropPreviewUrl: documentSnapshot['backdropPreviewUrl'],
          id: documentSnapshot['id'],
          name: documentSnapshot['name'],
          description: documentSnapshot['description'],
          premiereWorld: documentSnapshot['premiereWorld'],
          year: documentSnapshot['year'],
          budgetValue: documentSnapshot['budgetValue'],
          budgetCurrency: documentSnapshot['budgetCurrency'],
          posterUrl: documentSnapshot['posterUrl'],
          posterPreviewUrl: documentSnapshot['posterPreviewUrl'],
          genres: genres,
          persons: persons,
          shortDescription: documentSnapshot['shortDescription'],
          ageRating: documentSnapshot['ageRating'],
          videosUrl: documentSnapshot['videosUrl'],
          videosName: documentSnapshot['videosName'],
        );

        firebaseMoviesList.add(dbMovieModel);
      });
    }

    List<int> localDbId = allMoviesList.map((e) {
      return e.id;
    }).toList();

    List<int> webDbId = firebaseMoviesList.map((e) {
      return e.id;
    }).toList();

    if(localDbId.length != webDbId.length) {
      final missingMovies = findMissingIds(localDbId, webDbId);
      final missingIdsInWeb = findMissingIdsInWebList(localDbId, webDbId);

      missingMovies.forEach((element) {
        context.read<FirebaseCubit>().addLocalMovies(allMoviesList.firstWhere((item) => item.id == element));
      });

      if(missingIdsInWeb.isNotEmpty) {
        missingIdsInWeb.forEach((ids) {
          context.read<FirebaseCubit>().deleteLocalMovies(ids.toString());
        });
      }

    }


  }

  List<int> findMissingIds(List<int> firstList, List<int> secondList) {
    List<int> missingIds = [];

    for (int id in firstList) {
      if (!secondList.contains(id)) {
        missingIds.add(id);
      }
    }

    return missingIds;
  }

  List<int> findMissingIdsInWebList(List<int> firstList, List<int> secondList) {
    List<int> missingIds = [];

    for (int id in secondList) {
      if (!firstList.contains(id)) {
        missingIds.add(id);
      }
    }

    return missingIds;
  }

  Future<List<DbMovieModel>> getMoviesFromLocalDb() async{
    return await context.read<FavouriteCubit>().getAllMovies();
  }

  @override
  void initState() {
    compareDatabases();
    context.read<MovieBloc>().add(FetchMovies());

    Future.delayed(const Duration(milliseconds: 6000), () {
      context.pushReplacementNamed('/main');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(Assets.lottieLoading, repeat: false,),
      ),
    );
  }
}
