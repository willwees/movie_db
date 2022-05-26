import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/features/movie/bloc/movie_bloc.dart';
import 'package:moviedb/src/features/movie/ui/widgets/movie_card_list_widget.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(MovieGetNowPlayingListEvent());
    context.read<MovieBloc>().add(MovieGetUpcomingListEvent());
    context.read<MovieBloc>().add(MovieGetPopularListEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildNowPlayingSection(),
              const SizedBox(height: 16.0),
              _buildUpcomingSection(),
              const SizedBox(height: 16.0),
              _buildPopularSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNowPlayingSection() {
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: context.read<MovieBloc>(),
      buildWhen: (MovieState previous, MovieState current) =>
          previous.nowPlayingMovieList != current.nowPlayingMovieList,
      builder: (_, MovieState state) {
        return MovieCardListWidget(
          title: 'Now Playing',
          movieList: state.nowPlayingMovieList,
        );
      },
    );
  }

  Widget _buildUpcomingSection() {
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: context.read<MovieBloc>(),
      buildWhen: (MovieState previous, MovieState current) => previous.upcomingMovieList != current.upcomingMovieList,
      builder: (_, MovieState state) {
        return MovieCardListWidget(
          title: 'Upcoming',
          movieList: state.upcomingMovieList,
        );
      },
    );
  }

  Widget _buildPopularSection() {
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: context.read<MovieBloc>(),
      buildWhen: (MovieState previous, MovieState current) => previous.popularMovieList != current.popularMovieList,
      builder: (_, MovieState state) {
        return MovieCardListWidget(
          title: 'Popular',
          movieList: state.popularMovieList,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
