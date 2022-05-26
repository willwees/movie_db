part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovieList;
  final List<Movie> upcomingMovieList;
  final List<Movie> popularMovieList;

  const MovieState({
    this.nowPlayingMovieList = const <Movie>[],
    this.upcomingMovieList = const <Movie>[],
    this.popularMovieList = const <Movie>[],
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovieList,
    List<Movie>? upcomingMovieList,
    List<Movie>? popularMovieList,
  }) {
    return MovieState(
      nowPlayingMovieList: nowPlayingMovieList ?? this.nowPlayingMovieList,
      upcomingMovieList: upcomingMovieList ?? this.upcomingMovieList,
      popularMovieList: popularMovieList ?? this.popularMovieList,
    );
  }

  @override
  List<Object> get props => <Object>[
        nowPlayingMovieList,
        upcomingMovieList,
        popularMovieList,
      ];

  @override
  String toString() {
    return 'MovieState: { '
        'nowPlayingMovieList: $nowPlayingMovieList, '
        'upcomingMovieList: $upcomingMovieList, '
        'popularMovieList: $popularMovieList, '
        '}';
  }
}
