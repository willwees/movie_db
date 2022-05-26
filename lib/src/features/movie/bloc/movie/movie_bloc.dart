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
    on<MovieGetUpcomingListEvent>(_getUpcomingList);
    on<MovieGetPopularListEvent>(_getPopularList);
  }

  Future<void> _getNowPlayingList(MovieGetNowPlayingListEvent event, Emitter<MovieState> emit) async {
    try {
      final MoviesResponseModel result = await repository.getNowPlayingMovieList();

      emit(
        state.copyWith(
          nowPlayingMovieList: List<Movie>.of(state.nowPlayingMovieList)..addAll(result.movieList),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _getUpcomingList(MovieGetUpcomingListEvent event, Emitter<MovieState> emit) async {
    try {
      final MoviesResponseModel result = await repository.getUpcomingMovieList();

      emit(
        state.copyWith(
          upcomingMovieList: List<Movie>.of(state.upcomingMovieList)..addAll(result.movieList),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _getPopularList(MovieGetPopularListEvent event, Emitter<MovieState> emit) async {
    try {
      final MoviesResponseModel result = await repository.getPopularMovieList();

      emit(
        state.copyWith(
          popularMovieList: List<Movie>.of(state.popularMovieList)..addAll(result.movieList),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
