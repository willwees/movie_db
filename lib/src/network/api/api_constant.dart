class ApiConstant {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = '4b3c90b85b76b05b78a3b298031efcc5';
  static const String language = 'en-US';
  static const String baseImageSmallUrl = 'https://image.tmdb.org/t/p/w200';
  static const String baseImageOriginalUrl = 'https://image.tmdb.org/t/p/original';

  // Movie
  static const String getNowPlayingMovieList = '/movie/now_playing';
  static const String getUpcomingMovieList = '/movie/upcoming';
  static const String getPopularMovieList = '/movie/popular';
  static const String getMovieDetail = '/movie/{movieId}';
}
