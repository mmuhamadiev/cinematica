import 'package:dio/dio.dart';
import 'package:kinopoisk_search/config/constants/urls.dart';
import 'package:kinopoisk_search/data/data_sources/env.dart';
import 'package:kinopoisk_search/data/models/api_error.dart';
import 'package:kinopoisk_search/data/models/movie_model.dart';
import 'package:kinopoisk_search/data/models/movies_list_model.dart';
import 'package:kinopoisk_search/domain/repositories/locator.dart';

class ApiProvider {
  final Dio _dio;

  ApiProvider(this._dio);

  Future<MoviesListModel> getMovieList({
    required int page,
    required int limit,
    String? query,
  }) async {
    try {
      final response = await _dio.get(
        '${Url.baseUrl}${Url.apiVersion}${Url.apiCategory}${Url.apiAction}',
        queryParameters: _buildSearchQueryParameters(page, limit, query),
        options: Options(
          headers: {
            'X-API-KEY': Env.apiKey,
          },
        )
      );
      logger.d("Get Movies List --> ${response.data}");

      // Check if the response status code is OK (2xx)
      if (response.statusCode == 200) {
        return MoviesListModel.fromJson(response.data);
      } else {
        // If the status code is not OK, throw an exception with the error message
        final errorMessage = response.data['message'];
        throw ApiException(errorMessage ?? 'Unauthorized');
      }
    } catch (e) {
      logger.e("Error fetching movie list: $e");
      // Rethrow the exception to propagate it to the caller
      rethrow;
    }
  }

  Future<MovieModel> getMovieById({
    required String id,
  }) async {
    try {
      final response = await _dio.get(
          '${Url.baseUrl}${Url.apiVersion}${Url.apiCategory}/$id',
          options: Options(
            headers: {
              'X-API-KEY': Env.apiKey,
            },
          )
      );
      logger.d("Get Movie by id List --> ${response.data}");

      // Check if the response status code is OK (2xx)
      if (response.statusCode == 200) {
        return MovieModel.fromJson(response.data);
      } else {
        // If the status code is not OK, throw an exception with the error message
        final errorMessage = response.data['message'];
        throw ApiException(errorMessage ?? 'Unauthorized');
      }
    } catch (e) {
      logger.e("Error fetching Movie by id: $e");
      // Rethrow the exception to propagate it to the caller
      rethrow;
    }
  }

  Map<String, dynamic> _buildSearchQueryParameters(
      int page,
      int limit,
      String? query,
      ) {
    final Map<String, dynamic> queryParameters = {
      'page': page,
      'limit': limit,
    };
    if (query != null && query.isNotEmpty) {
      queryParameters['query'] = query;
    }
    return queryParameters;
  }
}