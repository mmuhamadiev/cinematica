import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kinopoisk_search/config/constants/app_colors.dart';
import 'package:kinopoisk_search/config/constants/app_text_styles.dart';
import 'package:kinopoisk_search/data/models/movies_list_model.dart';
import 'package:kinopoisk_search/presentation/manager/movie_bloc/movie_bloc.dart';
import 'package:kinopoisk_search/presentation/widgets/debouncer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final debouncer = Debouncer(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: 55.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                child: TextField(
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  style: AppTextStyles.body14w4.copyWith(color: AppColors.textColor1),
                  decoration: InputDecoration(
                      suffix: IconButton(onPressed: () {
                        setState(() {
                          searchController.clear();
                          FocusManager.instance.primaryFocus!.unfocus();
                        });
                        context.read<MovieBloc>().add(FetchMovies());
                      }, icon: const Icon(Icons.clear, size: 20,),
                      ),
                    constraints: BoxConstraints(
                      maxHeight: 55.h
                    )
                  ),
                  onChanged: (newText) {
                    if(newText.isEmpty) {
                      context.read<MovieBloc>().resetPageLimit;
                      context.read<MovieBloc>().add(FetchMovies());
                    } else {
                      debouncer.run(() {
                        context.read<MovieBloc>().add(FetchSearchMovies(query: newText));
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading && state.isFirstFetch) {
                    return const Center(child: SizedBox(
                      height: 4,
                      width: 50,
                      child: LinearProgressIndicator(),
                    ),
                    );
                  }
                  MoviesListModel moviesListModel = MoviesListModel(docs: [], total: 0, limit: 0, page: 0, pages: 0);
                  bool isLoadingMore = false;
                  if (state is MovieLoading) {
                    moviesListModel = state.moviesList!;
                    isLoadingMore = true;
                  } else if (state is MovieLoaded) {
                    moviesListModel = state.moviesList!;
                  }
                  if (moviesListModel.docs.isEmpty ||
                      moviesListModel == null) {
                    return Center(
                      child: Text('Обновите список потянув вниз', style: AppTextStyles.body16w7.copyWith(color: AppColors.textColor1),),
                    );
                  }
                  if (state is MovieError) {
                    return Center(child: Text(state.message, style: AppTextStyles.body16w7.copyWith(color: AppColors.textColor1),));
                  }
                  return RefreshIndicator(
                    onRefresh: () async{
                      context.read<MovieBloc>().add(FetchSearchMovies(query: searchController.text));
                    },
                    child: ListView.builder(
                      itemCount: isLoadingMore
                          ? moviesListModel.docs.length + 1
                          : moviesListModel.docs.length,
                      itemBuilder: (context, index) {

                        if (index < moviesListModel.docs.length) {
                          final movie = moviesListModel.docs[index];

                          return Column(
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
                                    imageUrl: movie.poster.previewUrl,
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
                                            child: Text('IMBD: ${movie.rating.imdb}', style: AppTextStyles.body12w4.copyWith(color: AppColors.textColor4, fontWeight: FontWeight.w700),),
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
                                    'isLocalPreview': 'false',
                                    'movieId': movie.id.toString()
                                  });
                                },
                              ),
                              SizedBox(height: 2.h),
                              const Divider()
                            ],
                          );
                        } else {
                          return const Center(
                            child: SizedBox(
                              height: 4,
                              width: 50,
                              child: LinearProgressIndicator(),
                            ),
                          );
                        }
                      },
                      controller: _scrollController,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }

  void _onScroll() {
    double scrollPercentage = 0.9;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll > (scrollPercentage * maxScroll)) {
      if(context.read<MovieBloc>().limit < context.read<MovieBloc>().totalLimit) {
        context.read<MovieBloc>().add(LoadMoreMovies(query: searchController.text));
      } else {

      }
    }
  }

}
