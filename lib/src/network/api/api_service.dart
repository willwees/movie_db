import 'package:dio/dio.dart';
import 'package:moviedb/src/network/api/api_constant.dart';
import 'package:moviedb/src/network/model/response/movie_detail_response_model.dart';
import 'package:moviedb/src/network/model/response/movies_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstant.getNowPlayingMovieList)
  Future<MoviesResponseModel> getNowPlayingMovieList(
    @Query('api_key') String apiKey,
    @Query('language') String language,
  );

  @GET(ApiConstant.getUpcomingMovieList)
  Future<MoviesResponseModel> getUpcomingMovieList(
    @Query('api_key') String apiKey,
    @Query('language') String language,
  );

  @GET(ApiConstant.getPopularMovieList)
  Future<MoviesResponseModel> getPopularMovieList(
    @Query('api_key') String apiKey,
    @Query('language') String language,
  );

  @GET(ApiConstant.getMovieDetail)
  Future<MovieDetailResponseModel> getMovieDetail(
    @Query('api_key') String apiKey,
    @Query('language') String language, {
    @Path(ApiConstant.movieId) required int movieId,
  });
}
