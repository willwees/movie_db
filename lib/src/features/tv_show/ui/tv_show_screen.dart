import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/constants/text/tv_show_text.dart';
import 'package:moviedb/src/features/movie/ui/widgets/movie_card_list_shimmer_widget.dart';
import 'package:moviedb/src/features/tv_show/bloc/tv_show/tvshow_bloc.dart';
import 'package:moviedb/src/features/tv_show/ui/widgets/tv_show_card_list_widget.dart';

class TVShowScreen extends StatefulWidget {
  const TVShowScreen({Key? key}) : super(key: key);

  @override
  State<TVShowScreen> createState() => _TVShowScreenState();
}

class _TVShowScreenState extends State<TVShowScreen> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<TVShowBloc>().add(TVShowGetTVOnTheAirListEvent());
    context.read<TVShowBloc>().add(TVShowGetPopularListEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(TVShowText.tvShow),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTVOnTheAirSection(),
              const SizedBox(height: 16.0),
              _buildPopularSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTVOnTheAirSection() {
    return BlocBuilder<TVShowBloc, TVShowState>(
      bloc: context.read<TVShowBloc>(),
      buildWhen: (TVShowState previous, TVShowState current) =>
          previous.tvOnTheAirTVShowList != current.tvOnTheAirTVShowList,
      builder: (_, TVShowState state) {
        if (state.tvOnTheAirTVShowList.isNotEmpty) {
          return TVShowCardListWidget(
            title: TVShowText.tvOnTheAir,
            tvShowList: state.tvOnTheAirTVShowList,
          );
        }

        // default loading
        return const MovieCardListShimmerWidget(title: TVShowText.tvOnTheAir);
      },
    );
  }

  Widget _buildPopularSection() {
    return BlocBuilder<TVShowBloc, TVShowState>(
      bloc: context.read<TVShowBloc>(),
      buildWhen: (TVShowState previous, TVShowState current) => previous.popularTVShowList != current.popularTVShowList,
      builder: (_, TVShowState state) {
        if (state.popularTVShowList.isNotEmpty) {
          return TVShowCardListWidget(
            title: TVShowText.popular,
            tvShowList: state.popularTVShowList,
          );
        }

        // default loading
        return const MovieCardListShimmerWidget(title: TVShowText.popular);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
