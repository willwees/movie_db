part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object?> get props => <Object>[];
}

class MovieDetailGetMovieDetailEvent extends MovieDetailEvent {
  final int movieId;

  const MovieDetailGetMovieDetailEvent({required this.movieId});

  @override
  List<Object?> get props => <Object>[movieId];
}

class MovieDetailGetMovieReviewListEvent extends MovieDetailEvent {
  final int movieId;

  const MovieDetailGetMovieReviewListEvent({required this.movieId});

  @override
  List<Object?> get props => <Object>[movieId];
}
