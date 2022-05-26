import 'package:flutter/material.dart';
import 'package:moviedb/src/constants/text/tv_show_text.dart';

class TVShowScreen extends StatefulWidget {
  const TVShowScreen({Key? key}) : super(key: key);

  @override
  State<TVShowScreen> createState() => _TVShowScreenState();
}

class _TVShowScreenState extends State<TVShowScreen> with AutomaticKeepAliveClientMixin {
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
    return Container();
  }

  Widget _buildPopularSection() {
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
