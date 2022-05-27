import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardReviewWidget extends StatelessWidget {
  final String username;
  final String content;
  final double? rating;

  const CardReviewWidget({
    Key? key,
    required this.username,
    required this.content,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    username,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                _buildRatingSection(context),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              content,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSection(BuildContext context) {
    if (rating == null) {
      return Container();
    }

    return Row(
      children: <Widget>[
        Text(
          '$rating',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(width: 4.0),
        RatingBar.builder(
          initialRating: rating! / 2,
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
      ],
    );
  }
}
