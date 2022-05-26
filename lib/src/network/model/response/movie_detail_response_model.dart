import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_response_model.g.dart';

@JsonSerializable()
class MovieDetailResponseModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'release_date')
  final String releaseDate;

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

  @JsonKey(name: 'original_title')
  final String originalTitle;

  const MovieDetailResponseModel(
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.genres,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.originalTitle,
  );

  @override
  List<Object> get props => <Object>[
        id,
        title,
        overview,
        releaseDate,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        originalTitle,
      ];

  factory MovieDetailResponseModel.fromJson(Map<String, dynamic> json) => _$MovieDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseModelToJson(this);
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
