import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/network/model/response/movie_detail_response_model.dart';
import 'package:moviedb/src/repository/api_repository.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final ApiRepository repository;

  MovieDetailBloc({required this.repository}) : super(const MovieDetailState()) {
    on<MovieDetailGetMovieDetailEvent>(_getMovieDetail);
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
}
