part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetailResponseModel? movieDetailResponseModel;

  const MovieDetailState({
    this.movieDetailResponseModel,
  });

  MovieDetailState copyWith({
    MovieDetailResponseModel? movieDetailResponseModel,
  }) {
    return MovieDetailState(
      movieDetailResponseModel: movieDetailResponseModel ?? this.movieDetailResponseModel,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    movieDetailResponseModel,
  ];

  @override
  String toString() {
    return 'MovieDetailState: { '
        'movieDetailResponseModel: $movieDetailResponseModel, '
        '}';
  }
}

