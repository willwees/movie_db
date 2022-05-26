import 'package:dio/dio.dart';
import 'package:moviedb/src/network/api/api_constant.dart';
import 'package:moviedb/src/network/model/response/movies_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstant.getMovieNowPlaying)
  Future<MoviesResponseModel> getMovieNowPlaying(
    @Query('api_key') String apiKey,
    @Query('language') String language,
    @Query('page') int page,
  );
}
