import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_shows_response_model.g.dart';

@JsonSerializable()
class TVShowsResponseModel extends Equatable {
  @JsonKey(name: 'results')
  final List<TVShow> tvShowList;

  const TVShowsResponseModel({
    this.tvShowList = const <TVShow>[],
  });

  @override
  List<Object?> get props => <Object>[tvShowList];

  factory TVShowsResponseModel.fromJson(Map<String, dynamic> json) => _$TVShowsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TVShowsResponseModelToJson(this);
}

@JsonSerializable()
class TVShow extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'first_air_date')
  final String firstAirDate;

  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'popularity')
  final double popularity;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'original_name')
  final String originalName;

  const TVShow(
    this.id,
    this.name,
    this.overview,
    this.firstAirDate,
    this.genreIds,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.originalName,
  );

  @override
  List<Object> get props => <Object>[
        id,
        name,
        overview,
        firstAirDate,
        genreIds,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        originalName,
      ];

  factory TVShow.fromJson(Map<String, dynamic> json) => _$TVShowFromJson(json);

  Map<String, dynamic> toJson() => _$TVShowToJson(this);
}
