import 'package:flutter/material.dart';
import 'package:movies_app/Home/DetailsScreen/DetailsScreen.dart';
import 'package:movies_app/model/popular.dart';
import 'package:movies_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class PopularItem extends StatelessWidget {
  Results? resultResponse;

  PopularItem(this.resultResponse);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      width: 130,
      height: 300,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DetailsScreen(resultResponse!),
                ),
              );
              // Navigator.pushNamed(
              //   context,
              //   DetailsScreen.routeName,
              //   arguments: topMovies,
              // );
            },
            child: Image.network(
              'https://image.tmdb.org/t/p/w500' +
                  '${resultResponse!.posterPath}',
              fit: BoxFit.cover,
              width: 130,
              height: 200,
            ),
          ),
          InkWell(
            onTap: () {
              provider.selectMovie(resultResponse!);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: provider.idList.contains(resultResponse!.id)
                  ? Image.asset('assets/images/ic_check.png')
                  : Image.asset('assets/images/ic_bookmark.png'),
            ),
          ),
        ],
      ),
    );
  }
}
