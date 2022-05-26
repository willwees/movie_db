import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_detail_response_model.g.dart';

@JsonSerializable()
class TVShowDetailResponseModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'first_air_date')
  final String firstAirDate;

  @JsonKey(name: 'genres')
  final List<Genre> genres;

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

  const TVShowDetailResponseModel(
      this.id,
      this.name,
      this.overview,
      this.firstAirDate,
      this.genres,
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
    voteAverage,
    popularity,
    posterPath,
    backdropPath,
    originalName,
  ];

  factory TVShowDetailResponseModel.fromJson(Map<String, dynamic> json) => _$TVShowDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TVShowDetailResponseModelToJson(this);
}

@JsonSerializable()
class Genre extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  const Genre(
      this.id,
      this.name,
      );

  @override
  List<Object?> get props => <Object>[
    id,
    name,
  ];

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
