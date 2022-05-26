import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviedb/src/constants/device_properties.dart';

class MovieCardWidget extends StatelessWidget {
  final String imageUrl;
  final String text;
  final double voteAverage;
  final VoidCallback onTap;

  const MovieCardWidget({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.voteAverage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kDeviceLogicalWidth / 2.5,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: <Widget>[
              _buildBackgroundImage(),
              _buildDescription(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Image.network(
        imageUrl,
        height: kDeviceLogicalWidth / 1.8,
        width: kDeviceLogicalWidth / 2.5,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 6.0, bottom: 6.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.white,
                shadows: <Shadow>[
                  const Shadow(blurRadius: 3.0),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            _buildRatingSection(context),
          ],
        ),
      ),
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
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: Colors.white,
            shadows: <Shadow>[
              const Shadow(blurRadius: 3.0),
            ],
          ),
        ),
      ],
    );
  }
}
