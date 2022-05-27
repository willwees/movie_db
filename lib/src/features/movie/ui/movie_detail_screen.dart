import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/constants/text/detail_text.dart';
import 'package:moviedb/src/features/movie/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:moviedb/src/features/movie/ui/widgets/movie_detail_header_widget.dart';
import 'package:moviedb/src/network/model/response/movie/movies_response_model.dart';
import 'package:moviedb/src/network/model/response/reviews_response_model.dart';
import 'package:moviedb/src/shared/widgets/movie_review_card_widget.dart';

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
  void initState() {
    super.initState();
    context.read<MovieDetailBloc>().add(MovieDetailGetMovieDetailEvent(movieId: widget.movie.id));
    context.read<MovieDetailBloc>().add(MovieDetailGetMovieReviewListEvent(movieId: widget.movie.id));
  }

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
            MovieDetailHeaderWidget(
              movieId: widget.movie.id,
              title: widget.movie.title,
              backdropPath: widget.movie.backdropPath,
              posterPath: widget.movie.posterPath,
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
            _buildReviewList(),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewList() {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      bloc: context.read<MovieDetailBloc>(),
      buildWhen: (MovieDetailState previous, MovieDetailState current) => previous.reviewList != current.reviewList,
      builder: (_, MovieDetailState state) {
        if (state.reviewList.isEmpty) {
          return Container();
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                DetailText.reviews,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8.0),
              ...state.reviewList
                  .map(
                    (Review review) => MovieReviewCardWidget(
                      avatarUrl: review.authorDetails.avatarPath,
                      username: review.author,
                      content: review.content,
                    ),
                  )
                  .toList(),
            ],
          ),
        );
      },
    );
  }
}
