import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/network/model/response/movie_detail_response_model.dart';
import 'package:moviedb/src/network/model/response/reviews_response_model.dart';
import 'package:moviedb/src/repository/api_repository.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final ApiRepository repository;

  MovieDetailBloc({required this.repository}) : super(const MovieDetailState()) {
    on<MovieDetailGetMovieDetailEvent>(_getMovieDetail);
    on<MovieDetailGetMovieReviewListEvent>(_getMovieReviewList);
  }

  Future<void> _getMovieDetail(MovieDetailGetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    try {
      final MovieDetailResponseModel result = await repository.getMovieDetail(movieId: event.movieId);

      emit(
        state.copyWith(
          movieDetailResponseModel: result,
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _getMovieReviewList(MovieDetailGetMovieReviewListEvent event, Emitter<MovieDetailState> emit) async {
    try {
      final ReviewsResponseModel result = await repository.getMovieDetailReviews(movieId: event.movieId);

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
