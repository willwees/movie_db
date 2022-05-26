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
        child: Column(
          children: <Widget>[
            _buildNowPlayingSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNowPlayingSection() {
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: context.read<MovieBloc>(),
      builder: (_, MovieState state) {
        return MovieCardListWidget(
          title: 'Now Playing',
          movieList: state.movieList,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
