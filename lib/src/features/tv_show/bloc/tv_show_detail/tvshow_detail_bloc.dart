import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/network/model/response/reviews_response_model.dart';
import 'package:moviedb/src/network/model/response/tv_show/tv_show_detail_response_model.dart';
import 'package:moviedb/src/repository/api_repository.dart';

part 'tvshow_detail_event.dart';
part 'tvshow_detail_state.dart';

class TVShowDetailBloc extends Bloc<TVShowDetailEvent, TVShowDetailState> {
  final ApiRepository repository;

  TVShowDetailBloc({required this.repository}) : super(const TVShowDetailState()) {
    on<TVShowDetailGetTVShowDetailEvent>(_getTVShowDetail);
    on<TVShowDetailGetTVShowReviewListEvent>(_getTVShowReviewList);
  }

  Future<void> _getTVShowDetail(TVShowDetailGetTVShowDetailEvent event, Emitter<TVShowDetailState> emit) async {
    try {
      final TVShowDetailResponseModel result = await repository.getTVShowDetail(tvShowId: event.tvShowId);

      emit(
        state.copyWith(
          tvShowDetailResponseModel: result,
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _getTVShowReviewList(TVShowDetailGetTVShowReviewListEvent event, Emitter<TVShowDetailState> emit) async {
    try {
      final ReviewsResponseModel result = await repository.getTVShowDetailReviews(tvShowId: event.tvShowId);

      emit(
        state.copyWith(
          reviewList: List<Review>.of(state.reviewList)..addAll(result.reviews),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
