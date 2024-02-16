import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kinopoisk_search/config/constants/app_colors.dart';
import 'package:kinopoisk_search/config/constants/app_text_styles.dart';
import 'package:kinopoisk_search/data/db_model/db_movie_model.dart';
import 'package:kinopoisk_search/data/models/movie_model.dart';
import 'package:kinopoisk_search/presentation/manager/firebase_bloc/firebase_cubit.dart';
import 'package:kinopoisk_search/presentation/pages/favourite/manager/favourite_cubit.dart';
import 'package:kinopoisk_search/presentation/pages/movie_datails/components/movie_parameters_box.dart';
import 'package:kinopoisk_search/presentation/pages/movie_datails/components/persons_image.dart';
import 'package:kinopoisk_search/presentation/pages/movie_datails/manager/movie_details_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, required this.isLocalPreview, required this.movieId});

  final bool isLocalPreview;
  final String movieId;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {

  @override
  void initState() {
    context.read<MovieDetailsCubit>().fetchMovieById(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: widget.isLocalPreview == false? BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
      if (state is MovieDetailsLoading) {
        return const Center(child: SizedBox(
            height: 4,
            width: 50,
            child: LinearProgressIndicator(),
          ),
        );
      } else if (state is MovieDetailsLoaded) {
        return RefreshIndicator(
          onRefresh: () async{
            context.read<MovieDetailsCubit>().fetchMovieById(widget.movieId);
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      width: 430.w,
                      height: 495.h,
                      fit: BoxFit.cover,
                      imageUrl: state.movieModel!.poster.previewUrl,
                      placeholder: (context, url) => LinearProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.image),
                    ),
                    Container(
                      width: 430.w,
                      height: 495.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xf000000).withOpacity(0.1), Color(0xf000000).withOpacity(0.2), Color(0xf000000).withOpacity(0.3), Color(0xf000000).withOpacity(0.6), Color(0xf000000).withOpacity(0.99)],
                          stops: [0.25, 0.4, 0.6, 0.8, 0.99],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      ),
                    ),
                    const Positioned(
                      left: 15,
                      top: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BackButton(
                            color: AppColors.ratingColor,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _launchUrl(Uri.parse(state.movieModel!.videos.trailers.last.url));
                    },icon: Icon(Icons.play_circle_outline, size: 80.w,), color: AppColors.ratingColor,),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        width: 430.w,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${state.movieModel!.name}', style: AppTextStyles.head32w4.copyWith(color: AppColors.textColor1, fontWeight: FontWeight.w700),),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    ...List.generate(state.movieModel!.genres.length, (index) {
                                      return Text('${state.movieModel!.genres[index].name}, ', style: AppTextStyles.body16w4.copyWith(color: AppColors.textColor1.withOpacity(0.9)));
                                    }),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.ratingColor
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('IMBD: ${state.movieModel!.rating.imdb}', style: AppTextStyles.body12w4.copyWith(color: AppColors.textColor4, fontWeight: FontWeight.w700),),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                movieParametersBox(state.movieModel!.year, state.movieModel!.votes.imdb.toStringAsFixed(0), state.movieModel!.ageRating),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: RichText(
                    text: TextSpan(
                    text: 'Общие сборы в мире: ',
                      style: AppTextStyles.body16w4.copyWith(color: AppColors.textColor1),
                      children: [
                        TextSpan(
                            text: '${state.movieModel!.fees.world.value}${state.movieModel!.fees.world.currency}',
                            style: AppTextStyles.head20w5.copyWith(color: AppColors.ratingColor),
                        ),
                      ]
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: RichText(
                    text: TextSpan(
                        text: 'Дата премьеры в мире: ',
                        style: AppTextStyles.body16w4.copyWith(color: AppColors.textColor1),
                        children: [
                          TextSpan(
                            text: '${DateFormat('dd - MM - yyyy').format(DateTime.parse(state.movieModel!.premiere.world))}',
                            style: AppTextStyles.head20w5.copyWith(color: AppColors.ratingColor),
                          ),
                        ]
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                persons_images(state.movieModel!.persons),
                Center(child: Text('Описание', style: AppTextStyles.head24w5.copyWith(color: AppColors.textColor1))),
                Center(child: Text('${state.movieModel!.description}', textAlign: TextAlign.center, style: AppTextStyles.body16w4.copyWith(color: AppColors.textColor1))),
              ],
            ),
          ),
        );
      } else if (state is MovieDetailsError) {
        return Center(child: Text(state.message));
      } else {
        return Container();
      }
      }
      ):
      FutureBuilder<List<DbMovieModel>>(
        future: context.read<FavouriteCubit>().getAllMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                height: 4,
                width: 50,
                child: LinearProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final movies = snapshot.data!;
            List<Persons> persons = [];
            movies[int.parse(widget.movieId)].persons.forEach((element) {
              element.forEach((key, value) {
                persons.add(Persons(id: 0,
                    photo: value,
                    name: key,
                    profession: '',
                    enProfession: ''
                ),
                );
              });
            });
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CachedNetworkImage(
                        width: 430.w,
                        height: 495.h,
                        fit: BoxFit.cover,
                        imageUrl: movies[int.parse(widget.movieId)].posterPreviewUrl,
                        placeholder: (context, url) => LinearProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.image),
                      ),
                      Container(
                        width: 430.w,
                        height: 495.h,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xf000000).withOpacity(0.1), Color(0xf000000).withOpacity(0.2), Color(0xf000000).withOpacity(0.3), Color(0xf000000).withOpacity(0.6), Color(0xf000000).withOpacity(0.99)],
                              stops: [0.25, 0.4, 0.6, 0.8, 0.99],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                        ),
                      ),
                      const Positioned(
                        left: 15,
                        top: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BackButton(
                              color: AppColors.ratingColor,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchUrl(Uri.parse(movies[int.parse(widget.movieId)].videosUrl));
                        },icon: Icon(Icons.play_circle_outline, size: 80.w,), color: AppColors.ratingColor,),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          width: 430.w,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${movies[int.parse(widget.movieId)].name}', style: AppTextStyles.head32w4.copyWith(color: AppColors.textColor1, fontWeight: FontWeight.w700),),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      ...List.generate(movies[int.parse(widget.movieId)].genres.length, (index) {
                                        return Text('${movies[int.parse(widget.movieId)].genres[index]}, ', style: AppTextStyles.body16w4.copyWith(color: AppColors.textColor1.withOpacity(0.9)));
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.ratingColor
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('IMBD: ${movies[int.parse(widget.movieId)].ratingImdb}', style: AppTextStyles.body12w4.copyWith(color: AppColors.textColor4, fontWeight: FontWeight.w700),),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  movieParametersBox(movies[int.parse(widget.movieId)].year, movies[int.parse(widget.movieId)].votesImdb.toStringAsFixed(0), movies[int.parse(widget.movieId)].ageRating),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: RichText(
                      text: TextSpan(
                          text: 'Общие сборы в мире: ',
                          style: AppTextStyles.body16w4.copyWith(color: AppColors.textColor1),
                          children: [
                            TextSpan(
                              text: '${movies[int.parse(widget.movieId)].worldValue}${movies[int.parse(widget.movieId)].worldCurrency}',
                              style: AppTextStyles.head20w5.copyWith(color: AppColors.ratingColor),
                            ),
                          ]
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: RichText(
                      text: TextSpan(
                          text: 'Дата премьеры в мире: ',
                          style: AppTextStyles.body16w4.copyWith(color: AppColors.textColor1),
                          children: [
                            TextSpan(
                              text: '${DateFormat('dd - MM - yyyy').format(DateTime.parse(movies[int.parse(widget.movieId)].premiereWorld))}',
                              style: AppTextStyles.head20w5.copyWith(color: AppColors.ratingColor),
                            ),
                          ]
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  persons_images(persons),
                  Center(child: Text('Описание', style: AppTextStyles.head24w5.copyWith(color: AppColors.textColor1))),
                  Center(child: Text('${movies[int.parse(widget.movieId)].description}', textAlign: TextAlign.center, style: AppTextStyles.body16w4.copyWith(color: AppColors.textColor1))),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: widget.isLocalPreview == true? null: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          return FloatingActionButton(
            child: (state is FavouriteLoading)? const LinearProgressIndicator(): (context.read<FirebaseCubit>().state is FirebaseLoading)? const LinearProgressIndicator(): const Icon(Icons.save),
            onPressed: () async{
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

              await context.read<FavouriteCubit>().insertToDatabase(dbMovieModel);
            },
          );
        }
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

}
