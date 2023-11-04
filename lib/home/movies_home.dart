import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/apiManager.dart';
import 'package:movies_app/home/components/popular_movie_item.dart';
import 'package:movies_app/home/components/recommended_movie_item.dart';
import 'package:movies_app/home/components/upcoming_movie_item.dart';
import 'package:movies_app/utils/MyTheme.dart';

class MoviesHomeScreen extends StatelessWidget {
  const MoviesHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: ApiManager.getPopularMovies(),
          builder: (context, snapshot) {
            var popularMoviesList = snapshot.data?.results ?? [];
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryLight,
                ),
              );
            } else if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return Column(
                children: [
                  Text(
                    'Something went wrong',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              );
            }
            return CarouselSlider.builder(
                itemCount: popularMoviesList.length,
                itemBuilder: (context, index, realIndex) {
                  return PopularMovieItem(
                    resultsPopular: popularMoviesList[index],
                  );
                },
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    height: 300));
          },
        ),

        //SizedBox(height: 10,),

        Container(
          padding: EdgeInsets.all(8),
          color: MyTheme.graybg,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New Releases',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: FutureBuilder(
                  future: ApiManager.getUpcomingMovies(),
                  builder: (context, snapshot) {
                    var upComingMoviesList = snapshot.data?.results ?? [];
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.primaryLight,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print("Error: ${snapshot.error}");
                      return Column(
                        children: [
                          Text(
                            'Something went wrong',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      );
                    }
                    return ListView.builder(
                      itemCount: upComingMoviesList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return UpComingMovieItem(
                          resultsUpcoming: upComingMoviesList[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),

        Container(
          padding: EdgeInsets.all(8),
          color: MyTheme.graybg,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Recommended',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: FutureBuilder(
                  future: ApiManager.getRecommendedMovies(),
                  builder: (context, snapshot) {
                    var recommendMoviesList = snapshot.data?.results ?? [];
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.primaryLight,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print("Error: ${snapshot.error}");
                      return Column(
                        children: [
                          Text(
                            'Something went wrong',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      );
                    }
                    return ListView.builder(
                      itemCount: recommendMoviesList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return RecommendedMovieItem(
                            resultsRecommended: recommendMoviesList[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
