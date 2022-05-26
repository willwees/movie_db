import 'package:dio/dio.dart';
import 'package:moviedb/src/network/api/api_constant.dart';
import 'package:moviedb/src/network/api/api_service.dart';
import 'package:moviedb/src/network/model/response/movie/movie_detail_response_model.dart';
import 'package:moviedb/src/network/model/response/movie/movies_response_model.dart';
import 'package:moviedb/src/network/model/response/reviews_response_model.dart';

class ApiRepository {
  late final ApiService _apiService;

  ApiRepository() {
    _apiService = ApiService(_generateDioClient());
  }

  Dio _generateDioClient() {
    final Dio dio = Dio(BaseOptions(contentType: 'application/json'));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions request, RequestInterceptorHandler interceptorHandler) async {
          // request.headers['Authorization'] = await getAuthToken();
          return interceptorHandler.next(request);
        },
        onError: (DioError error, ErrorInterceptorHandler interceptorHandler) {
          print('interceptor onError : ${error.response}');
        },
      ),
    );

    return dio;
  }

  Future<MoviesResponseModel> getNowPlayingMovieList({
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language,
  }) {
    return _apiService.getNowPlayingMovieList(apiKey, language);
  }

  Future<MoviesResponseModel> getUpcomingMovieList({
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language,
  }) {
    return _apiService.getUpcomingMovieList(apiKey, language);
  }

  Future<MoviesResponseModel> getPopularMovieList({
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language,
  }) {
    return _apiService.getPopularMovieList(apiKey, language);
  }

  Future<MovieDetailResponseModel> getMovieDetail({
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language,
    required int movieId,
  }) {
    return _apiService.getMovieDetail(
      apiKey,
      language,
      movieId: movieId,
    );
  }

  Future<ReviewsResponseModel> getMovieDetailReviews({
    String apiKey = ApiConstant.apiKey,
    String language = ApiConstant.language,
    required int movieId,
  }) {
    return _apiService.getMovieDetailReviews(
      apiKey,
      language,
      movieId: movieId,
    );
  }
}
