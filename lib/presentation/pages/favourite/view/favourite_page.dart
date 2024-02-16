import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kinopoisk_search/config/constants/app_colors.dart';
import 'package:kinopoisk_search/config/constants/app_text_styles.dart';
import 'package:kinopoisk_search/data/db_model/db_movie_model.dart';
import 'package:kinopoisk_search/data/models/movie_model.dart';
import 'package:kinopoisk_search/presentation/pages/favourite/manager/favourite_cubit.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DbMovieModel>>(
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
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return  Dismissible(
                key: UniqueKey(),
                onDismissed: (dismissDirection) async{
                  await context.read<FavouriteCubit>().deleteFromDatabase(movie.id);
                },
                direction: DismissDirection.endToStart,
                background: Container(
                  color: AppColors.redCancelBtnColor,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20), // Background color when swiping
                  child: const Icon(Icons.delete_forever, color: AppColors.accentColor,),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 50.w,
                        // height: 140.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.blueGrey,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          width: 50.w,
                          // height: 50.h,
                          fit: BoxFit.fitWidth,
                          imageUrl: movie.posterPreviewUrl,
                          placeholder: (context, url) => LinearProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.image),
                        ),
                      ),
                      title: Text(movie.name, style: AppTextStyles.head20w5.copyWith(color: AppColors.textColor1),),
                      subtitle: Text(movie.shortDescription, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppTextStyles.body12w4.copyWith(color: AppColors.textColor1) ),
                      trailing: UnconstrainedBox(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.ratingColor
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('IMBD: ${movie.ratingImdb}', style: AppTextStyles.body12w4.copyWith(color: AppColors.textColor4, fontWeight: FontWeight.w700),),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Icon(Icons.navigate_next, color: AppColors.accentColor,)
                          ],
                        ),
                      ),
                      onTap: () {
                        context.pushNamed('/movie_details', pathParameters: {
                          'isLocalPreview': 'true',
                          'movieId': index.toString()
                        });
                      },
                    ),
                    SizedBox(height: 2.h),
                    Divider(),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
