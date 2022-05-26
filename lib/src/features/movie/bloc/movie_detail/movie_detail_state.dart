part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetailResponseModel? movieDetailResponseModel;
  final List<Review> reviewList;

  const MovieDetailState({
    this.movieDetailResponseModel,
    this.reviewList = const <Review>[],
  });

  MovieDetailState copyWith({
    MovieDetailResponseModel? movieDetailResponseModel,
    List<Review>? reviewList,
  }) {
    return MovieDetailState(
      movieDetailResponseModel: movieDetailResponseModel ?? this.movieDetailResponseModel,
      reviewList: reviewList ?? this.reviewList,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    movieDetailResponseModel,
    reviewList,
  ];

  @override
  String toString() {
    return 'MovieDetailState: { '
        'movieDetailResponseModel: $movieDetailResponseModel, '
        'reviewList: $reviewList, '
        '}';
  }
}
