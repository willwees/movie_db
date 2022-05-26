import 'package:flutter/material.dart';
import 'package:moviedb/src/constants/text/detail_text.dart';
import 'package:moviedb/src/features/movie/ui/widgets/detail_header_widget.dart';
import 'package:moviedb/src/network/api/api_constant.dart';
import 'package:moviedb/src/network/model/response/movies_response_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(DetailText.detail),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DetailHeaderWidget(
              idMovie: widget.movie.id,
              title: widget.movie.title,
              imageBannerUrl: '${ApiConstant.baseImageOriginalUrl}${widget.movie.backdropPath}',
              imagePosterUrl: '${ApiConstant.baseImageSmallUrl}${widget.movie.posterPath}',
              voteAverage: widget.movie.voteAverage,
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.movie.overview,
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}