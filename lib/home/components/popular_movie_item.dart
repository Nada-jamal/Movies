import 'package:flutter/material.dart';
import 'package:movies_app/api/apiConstants.dart';
import 'package:movies_app/utils/MyTheme.dart';

import '../HomeResponse/PopularResponse.dart';

class PopularMovieItem extends StatelessWidget {
  ResultsPopular resultsPopular;

  PopularMovieItem({required this.resultsPopular});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: MyTheme.primaryLight),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                  ApiConstants.imagesUrl + resultsPopular.backdropPath!),
              Icon(
                Icons.play_circle,
                color: MyTheme.whiteColor,
                size: 90,
              ),
            ],
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17),
            child: Row(
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      Image.network(
                        ApiConstants.imagesUrl + resultsPopular.posterPath!,
                      ),
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
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Expanded(
                        child: Text(
                          resultsPopular.title!,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Text(resultsPopular.releaseDate!,
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
