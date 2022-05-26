part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final int page;
  final List<Movie> movieList;

  const MovieState({
    this.page = 1,
    this.movieList = const <Movie>[],
  });

  MovieState copyWith({
    int? page,
    List<Movie>? movieList,
  }) {
    return MovieState(
      page: page ?? this.page,
      movieList: movieList ?? this.movieList,
    );
  }

  @override
  List<Object> get props => <Object>[
        page,
        movieList,
      ];

  @override
  String toString() {
    return 'MovieState: { '
        'page: $page, '
        'movieList: $movieList, '
        '}';
  }
}
