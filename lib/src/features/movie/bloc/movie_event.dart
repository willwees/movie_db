part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => <Object>[];
}

class MovieGetNowPlayingListEvent extends MovieEvent {}

class MovieGetUpcomingListEvent extends MovieEvent {}

class MovieGetPopularListEvent extends MovieEvent {}
