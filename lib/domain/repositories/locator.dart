import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:kinopoisk_search/data/network/api_provider.dart';
import 'package:kinopoisk_search/data/repositories/movies_repository.dart';
import 'package:kinopoisk_search/data/sqflite_helper/movie_database.dart';
import 'package:kinopoisk_search/presentation/manager/firebase_bloc/firebase_cubit.dart';
import 'package:kinopoisk_search/presentation/manager/internet_bloc/internet_cubit.dart';
import 'package:kinopoisk_search/presentation/manager/movie_bloc/movie_bloc.dart';
import 'package:kinopoisk_search/presentation/pages/favourite/manager/favourite_cubit.dart';
import 'package:kinopoisk_search/presentation/pages/main/manager/main_cubit.dart';
import 'package:kinopoisk_search/presentation/pages/movie_datails/manager/movie_details_cubit.dart';
import 'package:kinopoisk_search/presentation/pages/splash/manager/splash_cubit.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
final logger = Logger(
  printer: PrettyPrinter(),
);

setupConfiguration() async {

  // Directory directory = await pathProvider.getApplicationDocumentsDirectory();

  final movieDB = MovieDatabase.instance;

  await movieDB.initializeDB();

  var dio = Dio();

  Connectivity connectivity = Connectivity();

  dio.interceptors.add(LogInterceptor());

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<MovieDatabase>(() => movieDB);

  getIt.registerSingleton<ApiProvider>(
    ApiProvider(dio),
  );
  getIt.registerSingleton<Connectivity>(
    Connectivity()
  );

  getIt.registerFactory<MoviesRepositoryImpl>(() => MoviesRepositoryImpl(
    getIt<ApiProvider>(),
  ));

  getIt.registerFactory<SplashCubit>(() => SplashCubit());
  getIt.registerFactory<MainCubit>(() => MainCubit());
  getIt.registerFactory<MovieDetailsCubit>(() => MovieDetailsCubit(
    getIt<MoviesRepositoryImpl>(),
  ));
  getIt.registerFactory<FavouriteCubit>(() => FavouriteCubit(
    getIt<MovieDatabase>(),
  ));
  getIt.registerFactory<MovieBloc>(() => MovieBloc(
    getIt<MoviesRepositoryImpl>(),
  ));
  getIt.registerFactory<FirebaseCubit>(() => FirebaseCubit());
  getIt.registerFactory<InternetCubit>(() => InternetCubit(
    getIt<Connectivity>(),
  ));

}