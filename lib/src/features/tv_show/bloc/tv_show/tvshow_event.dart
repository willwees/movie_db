part of 'tvshow_bloc.dart';

abstract class TVShowEvent extends Equatable {
  const TVShowEvent();

  @override
  List<Object?> get props => <Object>[];
}

class TVShowGetTVOnTheAirListEvent extends TVShowEvent {}

class TVShowGetPopularListEvent extends TVShowEvent {}
