import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_response_model.g.dart';

@JsonSerializable()
class MoviesResponseModel {
  @JsonKey(name: 'results')
  final List<Movie> movieList;

  MoviesResponseModel({
    this.movieList = const <Movie>[],
  });

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) => _$MoviesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseModelToJson(this);
}

@JsonSerializable()
class Movie extends Equatable {
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

  @JsonKey(name: 'original_title')
  final String originalTitle;

  const Movie(
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.genreIds,
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
        genreIds,
        voteAverage,
        popularity,
        posterPath,
        backdropPath,
        originalTitle,
      ];

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
