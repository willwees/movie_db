import 'package:flutter/material.dart';
import 'package:moviedb/src/constants/device_properties.dart';
import 'package:moviedb/src/constants/route_paths.dart';
import 'package:moviedb/src/features/movie/ui/widgets/movie_card_widget.dart';
import 'package:moviedb/src/network/api/api_constant.dart';
import 'package:moviedb/src/network/model/response/movies_response_model.dart';

class MovieCardListWidget extends StatelessWidget {
  final String title;
  final List<Movie> movieList;

  const MovieCardListWidget({
    Key? key,
    required this.title,
    required this.movieList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(
          height: kDeviceLogicalWidth / 1.8,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            itemBuilder: (_, int index) {
              return MovieCardWidget(
                imageUrl: '${ApiConstant.baseImageUrl}${movieList[index].posterPath}',
                text: movieList[index].title,
                voteAverage: movieList[index].voteAverage,
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.detail, arguments: movieList[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
