import 'package:dio/dio.dart';
import 'package:moviedb/src/network/api/api_constant.dart';
import 'package:moviedb/src/network/api/api_service.dart';
import 'package:moviedb/src/network/model/response/movies_response_model.dart';

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
}
