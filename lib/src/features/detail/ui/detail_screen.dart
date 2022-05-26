import 'package:flutter/material.dart';
import 'package:moviedb/src/constants/text/detail_text.dart';
import 'package:moviedb/src/network/model/response/movies_response_model.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(DetailText.detail),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(movie.title),
              const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
