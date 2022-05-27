import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviedb/src/constants/asset_names.dart';
import 'package:moviedb/src/constants/device_properties.dart';
import 'package:moviedb/src/constants/transparent_images.dart';
import 'package:moviedb/src/features/movie/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:moviedb/src/network/api/api_constant.dart';
import 'package:moviedb/src/network/model/response/movie/movie_detail_response_model.dart';

class MovieDetailHeaderWidget extends StatelessWidget {
  final int movieId;
  final String title;
  final String? backdropPath;
  final String? posterPath;
  final double voteAverage;

  const MovieDetailHeaderWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBanner(),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              if (posterPath != null)
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: '${ApiConstant.baseImageSmallUrl}$posterPath',
                  height: 200,
                )
              else
                Image.asset(
                  GeneralAssetNames.movieDbLogoPng,
                  width: 150,
                ),
              const SizedBox(width: 16.0),
              Expanded(
                child: _buildMovieInfo(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    if (backdropPath != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: kDeviceLogicalWidth / 3),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: '${ApiConstant.baseImageOriginalUrl}$backdropPath',
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(bottom: kDeviceLogicalWidth / 3),
      child: Image.asset(
        GeneralAssetNames.movieDbLogoShortPng,
        width: kDeviceLogicalWidth,
      ),
    );
  }

  Widget _buildMovieInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        _buildRatingSection(context),
        _buildGenreSection(context),
      ],
    );
  }

  Widget _buildRatingSection(BuildContext context) {
    return Row(
      children: <Widget>[
        RatingBar.builder(
          initialRating: voteAverage / 2,
          allowHalfRating: true,
          ignoreGestures: true,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (_, __) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemSize: 16.0,
          onRatingUpdate: (double rating) {},
        ),
        const SizedBox(width: 4.0),
        Text(
          '$voteAverage',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  Widget _buildGenreSection(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      bloc: context.read<MovieDetailBloc>(),
      buildWhen: (MovieDetailState previous, MovieDetailState current) =>
          previous.movieDetailResponseModel != current.movieDetailResponseModel,
      builder: (_, MovieDetailState state) {
        if (state.movieDetailResponseModel == null) {
          return Container();
        }

        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.movieDetailResponseModel!.genres
                  .map(
                    (Genre genre) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Chip(
                        label: Text(genre.name),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
