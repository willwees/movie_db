import 'package:dio/dio.dart';
import 'package:moviedb/src/network/api/api_constant.dart';
import 'package:moviedb/src/network/model/response/movie/movie_detail_response_model.dart';
import 'package:moviedb/src/network/model/response/movie/movies_response_model.dart';
import 'package:moviedb/src/network/model/response/reviews_response_model.dart';
import 'package:moviedb/src/network/model/response/tv_show/tv_show_detail_response_model.dart';
import 'package:moviedb/src/network/model/response/tv_show/tv_shows_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // MOVIE
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
    @Path('movieId') required int movieId,
  });

  @GET(ApiConstant.getMovieDetailReviews)
  Future<ReviewsResponseModel> getMovieDetailReviews(
      @Query('api_key') String apiKey,
      @Query('language') String language, {
        @Path('movieId') required int movieId,
      });

  // TV SHOW
  @GET(ApiConstant.getTVOnTheAirTVShowList)
  Future<TVShowsResponseModel> getTVOnTheAirTVShowList(
      @Query('api_key') String apiKey,
      @Query('language') String language,
      );

  @GET(ApiConstant.getPopularTVShowList)
  Future<TVShowsResponseModel> getPopularTVShowList(
      @Query('api_key') String apiKey,
      @Query('language') String language,
      );

  @GET(ApiConstant.getTVShowDetail)
  Future<TVShowDetailResponseModel> getTVShowDetail(
      @Query('api_key') String apiKey,
      @Query('language') String language, {
        @Path('tvShowId') required int tvShowId,
      });

  @GET(ApiConstant.getTVShowDetailReviews)
  Future<ReviewsResponseModel> getTVShowDetailReviews(
      @Query('api_key') String apiKey,
      @Query('language') String language, {
        @Path('tvShowId') required int tvShowId,
      });
}
