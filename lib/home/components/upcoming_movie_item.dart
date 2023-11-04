import 'package:flutter/material.dart';
import 'package:movies_app/home/HomeResponse/UpcomingResponse.dart';
import 'package:movies_app/utils/MyTheme.dart';

import '../../api/apiConstants.dart';

class UpComingMovieItem extends StatelessWidget {
  ResultsUpcoming resultsUpcoming;

  UpComingMovieItem({required this.resultsUpcoming});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Image.network(ApiConstants.imagesUrl + resultsUpcoming.posterPath!),
          Positioned(
            top: 0,
            left: 0,
            child: Icon(
              Icons.bookmarks,
              color: MyTheme.grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
