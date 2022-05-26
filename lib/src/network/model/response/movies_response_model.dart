import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_response_model.g.dart';

@JsonSerializable()
class MoviesResponseModel {
  @JsonKey(name: 'results')
  final List<Movies> results;

  MoviesResponseModel({
    this.results = const <Movies>[],
  });

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) => _$MoviesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseModelToJson(this);
}

@JsonSerializable()
class Movies extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'release_date')
  final String releaseDate;

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

  @JsonKey(name: 'first_air_date')
  final String firstAirDate;

  const Movies(
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.voteAverage,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.originalName,
    this.firstAirDate,
  );

  @override
  List<Object> get props => <Object>[
        id,
        title,
        overview,
        releaseDate,
        genreIds,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        originalName,
        firstAirDate,
      ];

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
