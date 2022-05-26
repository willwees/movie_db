import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviedb/src/constants/device_properties.dart';
import 'package:moviedb/src/constants/transparent_images.dart';

class DetailHeaderWidget extends StatelessWidget {
  final int idMovie;
  final String title;
  final String imageBannerUrl;
  final String imagePosterUrl;
  final double voteAverage;

  const DetailHeaderWidget({
    Key? key,
    required this.idMovie,
    required this.title,
    required this.imageBannerUrl,
    required this.imagePosterUrl,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: kDeviceLogicalWidth / 4),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: imageBannerUrl,
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imagePosterUrl,
                height: 200,
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
        const SizedBox(height: 8.0),
        _buildRatingSection(context),
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
}
