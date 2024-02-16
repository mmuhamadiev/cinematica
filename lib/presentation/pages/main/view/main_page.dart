import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kinopoisk_search/config/constants/app_colors.dart';
import 'package:kinopoisk_search/data/db_model/db_movie_model.dart';
import 'package:kinopoisk_search/presentation/manager/firebase_bloc/firebase_cubit.dart';
import 'package:kinopoisk_search/presentation/manager/internet_bloc/internet_cubit.dart';
import 'package:kinopoisk_search/presentation/pages/favourite/manager/favourite_cubit.dart';
import 'package:kinopoisk_search/presentation/pages/favourite/view/favourite_page.dart';
import 'package:kinopoisk_search/presentation/pages/home/view/home_page.dart';
import 'package:kinopoisk_search/presentation/pages/main/manager/main_cubit.dart';
import 'package:kinopoisk_search/presentation/pages/movie_datails/manager/movie_details_cubit.dart';
import 'package:kinopoisk_search/presentation/widgets/deleted_notification.dart';
import 'package:kinopoisk_search/presentation/widgets/on_internet_notification.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<InternetCubit, InternetState>(
        listener: (context, state) {
          if(state is InternetOffState) {
            showNoInternetToast(context);
          }
        },
        child: BlocListener<FavouriteCubit, FavouriteState>(
          listener: (context, state) {
            if(state is FavouriteAdded) {
              if(context.read<InternetCubit>().state is InternetOnState) {

                List<String> genres = (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.genres.map((e) {
                  return e.name;
                }).toList();
                List<Map<String, String>> persons = (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.persons.map((e) {
                  return {
                    e.name: e.photo
                  };
                }).toList();

                DbMovieModel dbMovieModel = DbMovieModel(
                    worldValue: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.fees.world.value,
                    worldCurrency: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.fees.world.currency,
                    ratingImdb: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.rating.imdb,
                    ratingFilmCritics: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.rating.filmCritics,
                    ratingRussianFilmCritics: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.rating.russianFilmCritics,
                    votesImdb: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.votes.imdb,
                    votesFilmCritics: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.votes.filmCritics,
                    votesRussianFilmCritics: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.votes.russianFilmCritics,
                    backdropUrl: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.backdrop.url,
                    backdropPreviewUrl: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.backdrop.previewUrl,
                    id: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.id,
                    name: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.name,
                    description: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.description,
                    premiereWorld: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.premiere.world,
                    year: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.year,
                    budgetValue: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.budget.value,
                    budgetCurrency: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.budget.currency,
                    posterUrl: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.poster.url,
                    posterPreviewUrl: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.poster.previewUrl,
                    genres: genres,
                    persons: persons,
                    shortDescription: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.shortDescription,
                    ageRating: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.ageRating,
                    videosUrl: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.videos.trailers.last.url,
                    videosName: (context.read<MovieDetailsCubit>().state as MovieDetailsLoaded).movieModel!.videos.trailers.last.name
                );

                context.read<FirebaseCubit>().saveNewMovie(dbMovieModel);
              } else {
                context.pop();
              }
            }
            if(state is FavouriteDeleted) {
              if(context.read<InternetCubit>().state is InternetOnState) {
                context.read<FirebaseCubit>().deleteFirebaseMovieHistory(state.id);
              } else {
                showTopNotFilledToast(context);
              }
            }
          },
          child: BlocListener<FirebaseCubit, FirebaseState>(
            listener: (context, state) {
              if(state is FirebaseAdded) {
                context.pop();
              }
              if(state is FirebaseDeleted) {
                showTopNotFilledToast(context);
              }
            },
            child: PageView(
                controller: context.read<MainCubit>().mainPageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  HomePage(),
                  FavouritePage(),
                ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return SizedBox(
              width: 430.w,
              child: CustomNavigationBar(
                isFloating: true,
                iconSize: 30.0,
                // strokeColor: AppColors.brown,
                borderRadius: Radius.circular(15.r),
                selectedColor: Color(0xff60748a),
                unSelectedColor: Theme.of(context).primaryColorDark,
                backgroundColor: Color(0xfff4ca7e),
                items: [
                  CustomNavigationBarItem(
                    icon: Transform.scale(
                        scale: 0.8,
                        child: Icon(Icons.home_max)
                    ),
                    selectedIcon: Transform.scale(
                      scale: 1,
                      child: Icon(Icons.home_max),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Transform.scale(
                      scale: 0.8,
                      child: Icon(Icons.star_outline),
                    ),
                    selectedIcon: Transform.scale(
                      scale: 1,
                      child: Icon(Icons.star_outlined),
                    ),
                  ),
                ],
                currentIndex: state.navbarIndex,
                onTap: (index) {
                  context.read<MainCubit>().mainPageController.jumpToPage(index);
                  context.read<MainCubit>().changeNavBarIndex(index);
                },
              ),
            );
          }
      ),
    );
  }

}
