import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/repository/api_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiRepository repository;

  MovieBloc({required this.repository}) : super(const MovieState()) {
    on<MovieGetNowPlayingListEvent>(_getNowPlayingList);
  }

  Future<void> _getNowPlayingList(MovieGetNowPlayingListEvent event, Emitter<MovieState> emit) async {

  }
}
