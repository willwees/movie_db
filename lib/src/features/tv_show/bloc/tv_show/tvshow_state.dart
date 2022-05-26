part of 'tvshow_bloc.dart';

class TVShowState extends Equatable {
  final List<TVShow> tvOnTheAirTVShowList;
  final List<TVShow> popularTVShowList;

  const TVShowState({
    this.tvOnTheAirTVShowList = const <TVShow>[],
    this.popularTVShowList = const <TVShow>[],
  });

  TVShowState copyWith({
    List<TVShow>? tvOnTheAirTVShowList,
    List<TVShow>? popularTVShowList,
  }) {
    return TVShowState(
      tvOnTheAirTVShowList: tvOnTheAirTVShowList ?? this.tvOnTheAirTVShowList,
      popularTVShowList: popularTVShowList ?? this.popularTVShowList,
    );
  }

  @override
  List<Object> get props => <Object>[
    tvOnTheAirTVShowList,
    popularTVShowList,
  ];

  @override
  String toString() {
    return 'TVShowState: { '
        'tvOnTheAirTVShowList: $tvOnTheAirTVShowList, '
        'popularMovieList: $popularTVShowList, '
        '}';
  }
}
