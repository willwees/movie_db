import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/network/model/response/movies_response_model.dart';
import 'package:moviedb/src/repository/api_repository.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiRepository repository;

  MovieBloc({required this.repository}) : super(const MovieState()) {
    on<MovieGetNowPlayingListEvent>(_getNowPlayingList);
  }

  Future<void> _getNowPlayingList(MovieGetNowPlayingListEvent event, Emitter<MovieState> emit) async {
    try {
      final MoviesResponseModel result = await repository.getMovieNowPlaying(page: state.page);

      emit(
        state.copyWith(
          page: state.page + 1,
          movieList: List<Movie>.of(state.movieList)..addAll(result.movieList),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
