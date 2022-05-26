import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/network/model/response/tv_show/tv_shows_response_model.dart';
import 'package:moviedb/src/repository/api_repository.dart';

part 'tvshow_event.dart';
part 'tvshow_state.dart';

class TVShowBloc extends Bloc<TVShowEvent, TVShowState> {
  final ApiRepository repository;

  TVShowBloc({required this.repository}) : super(const TVShowState()) {
    on<TVShowGetTVOnTheAirListEvent>(_getTVOnTheAirList);
    on<TVShowGetPopularListEvent>(_getPopularList);
  }

  Future<void> _getTVOnTheAirList(TVShowGetTVOnTheAirListEvent event, Emitter<TVShowState> emit) async {
    try {
      final TVShowsResponseModel result = await repository.getTVOnTheAirTVShowList();

      emit(
        state.copyWith(
          tvOnTheAirTVShowList: List<TVShow>.of(state.tvOnTheAirTVShowList)..addAll(result.tvShowList),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _getPopularList(TVShowGetPopularListEvent event, Emitter<TVShowState> emit) async {
    try {
      final TVShowsResponseModel result = await repository.getPopularTVShowList();

      emit(
        state.copyWith(
          popularTVShowList: List<TVShow>.of(state.popularTVShowList)..addAll(result.tvShowList),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
