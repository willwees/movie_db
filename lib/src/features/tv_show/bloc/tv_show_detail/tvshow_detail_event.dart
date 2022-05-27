part of 'tvshow_detail_bloc.dart';

abstract class TVShowDetailEvent extends Equatable {
  const TVShowDetailEvent();

  @override
  List<Object?> get props => <Object>[];
}

class TVShowDetailGetTVShowDetailEvent extends TVShowDetailEvent {
  final int tvShowId;

  const TVShowDetailGetTVShowDetailEvent({required this.tvShowId});

  @override
  List<Object?> get props => <Object>[tvShowId];
}

class TVShowDetailGetTVShowReviewListEvent extends TVShowDetailEvent {
  final int tvShowId;

  const TVShowDetailGetTVShowReviewListEvent({required this.tvShowId});

  @override
  List<Object?> get props => <Object>[tvShowId];
}
