import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/constants/text/detail_text.dart';
import 'package:moviedb/src/features/tv_show/bloc/tv_show_detail/tvshow_detail_bloc.dart';
import 'package:moviedb/src/features/tv_show/ui/widgets/tv_show_detail_header_widget.dart';
import 'package:moviedb/src/network/model/response/reviews_response_model.dart';
import 'package:moviedb/src/network/model/response/tv_show/tv_shows_response_model.dart';
import 'package:moviedb/src/shared/widgets/movie_review_card_widget.dart';

class TVShowDetailScreen extends StatefulWidget {
  final TVShow tvShow;

  const TVShowDetailScreen({
    Key? key,
    required this.tvShow,
  }) : super(key: key);

  @override
  State<TVShowDetailScreen> createState() => _TVShowDetailScreenState();
}

class _TVShowDetailScreenState extends State<TVShowDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TVShowDetailBloc>().add(TVShowDetailGetTVShowDetailEvent(tvShowId: widget.tvShow.id));
    context.read<TVShowDetailBloc>().add(TVShowDetailGetTVShowReviewListEvent(tvShowId: widget.tvShow.id));
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
            TVShowDetailHeaderWidget(
              tvShowId: widget.tvShow.id,
              title: widget.tvShow.name,
              backdropPath: widget.tvShow.backdropPath,
              posterPath: widget.tvShow.posterPath,
              voteAverage: widget.tvShow.voteAverage,
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.tvShow.overview,
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
    return BlocBuilder<TVShowDetailBloc, TVShowDetailState>(
      bloc: context.read<TVShowDetailBloc>(),
      buildWhen: (TVShowDetailState previous, TVShowDetailState current) => previous.reviewList != current.reviewList,
      builder: (_, TVShowDetailState state) {
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
