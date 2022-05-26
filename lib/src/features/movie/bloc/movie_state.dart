part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovieList;

  const MovieState({
    this.nowPlayingMovieList = const <Movie>[],
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovieList,
  }) {
    return MovieState(
      nowPlayingMovieList: nowPlayingMovieList ?? this.nowPlayingMovieList,
    );
  }

  @override
  List<Object> get props => <Object>[
        nowPlayingMovieList,
      ];

  @override
  String toString() {
    return 'MovieState: { '
        'nowPlayingMovieList: $nowPlayingMovieList, '
        '}';
  }
}
