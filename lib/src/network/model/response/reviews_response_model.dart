import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reviews_response_model.g.dart';

@JsonSerializable()
class ReviewsResponseModel extends Equatable {
  @JsonKey(name: 'results')
  final List<Review> reviews;

  const ReviewsResponseModel(
    this.reviews,
  );

  @override
  List<Object> get props => <Object>[
        reviews,
      ];

  factory ReviewsResponseModel.fromJson(Map<String, dynamic> json) => _$ReviewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsResponseModelToJson(this);
}

@JsonSerializable()
class Review extends Equatable {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'author')
  final String author;

  @JsonKey(name: 'author_details')
  final AuthorDetails authorDetails;

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'url')
  final String url;

  const Review(
    this.id,
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.url,
  );

  @override
  List<Object> get props => <Object>[
        id,
        author,
        authorDetails,
        content,
        createdAt,
        updatedAt,
        url,
      ];

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class AuthorDetails extends Equatable {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'avatar_path')
  final String? avatarPath;

  @JsonKey(name: 'rating')
  final double? rating;

  const AuthorDetails(
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  );

  @override
  List<Object?> get props => <Object?>[
        name,
        username,
        avatarPath,
        rating,
      ];

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => _$AuthorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);
}
