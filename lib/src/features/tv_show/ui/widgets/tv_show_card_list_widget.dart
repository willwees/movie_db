import 'package:flutter/material.dart';
import 'package:moviedb/src/constants/device_properties.dart';
import 'package:moviedb/src/constants/route_paths.dart';
import 'package:moviedb/src/network/api/api_constant.dart';
import 'package:moviedb/src/network/model/response/tv_show/tv_shows_response_model.dart';
import 'package:moviedb/src/shared/widgets/card_movie_widget.dart';

class TVShowCardListWidget extends StatelessWidget {
  final String title;
  final List<TVShow> tvShowList;

  const TVShowCardListWidget({
    Key? key,
    required this.title,
    required this.tvShowList,
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
            itemCount: tvShowList.length,
            itemBuilder: (_, int index) {
              return CardMovieWidget(
                imageUrl: '${ApiConstant.baseImageSmallUrl}${tvShowList[index].posterPath}',
                text: tvShowList[index].name,
                voteAverage: tvShowList[index].voteAverage,
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.tvShowDetail, arguments: tvShowList[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
