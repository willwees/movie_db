part of 'tvshow_detail_bloc.dart';

class TVShowDetailState extends Equatable {
  final TVShowDetailResponseModel? tvShowDetailResponseModel;
  final List<Review> reviewList;

  const TVShowDetailState({
    this.tvShowDetailResponseModel,
    this.reviewList = const <Review>[],
  });

  TVShowDetailState copyWith({
    TVShowDetailResponseModel? tvShowDetailResponseModel,
    List<Review>? reviewList,
  }) {
    return TVShowDetailState(
      tvShowDetailResponseModel: tvShowDetailResponseModel ?? this.tvShowDetailResponseModel,
      reviewList: reviewList ?? this.reviewList,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    tvShowDetailResponseModel,
    reviewList,
  ];

  @override
  String toString() {
    return 'TVShowDetailState: { '
        'tvOnTheAirTVShowList: $tvShowDetailResponseModel, '
        'reviewList: $reviewList, '
        '}';
  }
}
