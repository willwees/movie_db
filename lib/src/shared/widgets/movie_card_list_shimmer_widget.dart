import 'package:flutter/material.dart';
import 'package:moviedb/src/constants/app_colors.dart';
import 'package:moviedb/src/constants/device_properties.dart';
import 'package:moviedb/src/shared/widgets/movie_card_widget.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardListShimmerWidget extends StatelessWidget {
  final String title;

  const MovieCardListShimmerWidget({
    Key? key,
    required this.title,
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
            itemCount: 5,
            itemBuilder: (_, int index) {
              return Shimmer.fromColors(
                baseColor: AppColors.kDarkBlue,
                highlightColor: AppColors.kLightBlue,
                child: MovieCardWidget(
                  imageUrl: 'https://picsum.photos/250?image=9',
                  text: 'Movie',
                  voteAverage: 6.8,
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
