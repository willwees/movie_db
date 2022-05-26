import 'package:flutter/material.dart';

class MovieReviewCardWidget extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final String content;

  const MovieReviewCardWidget({
    Key? key,
    required this.avatarUrl,
    required this.username,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                username,
                style: Theme.of(context).textTheme.subtitle2,
              ),
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
}
