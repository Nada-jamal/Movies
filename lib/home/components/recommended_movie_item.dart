import 'package:flutter/material.dart';
import 'package:movies_app/home/HomeResponse/RecommendedResponse.dart';

import '../../api/apiConstants.dart';
import '../../utils/MyTheme.dart';

class RecommendedMovieItem extends StatelessWidget {
  ResultsRecommended resultsRecommended;

  RecommendedMovieItem({required this.resultsRecommended});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      color: MyTheme.cardGrayColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Image.network(
                    ApiConstants.imagesUrl + resultsRecommended.posterPath!),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: MyTheme.yellowColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${resultsRecommended.voteAverage}',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          Text(resultsRecommended.title!,
              style: Theme.of(context).textTheme.titleSmall),
          Text(resultsRecommended.releaseDate!,
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
