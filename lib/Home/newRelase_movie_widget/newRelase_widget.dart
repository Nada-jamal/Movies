import 'package:flutter/material.dart';
import 'package:movies_app/Home/newRelase_movie_widget/newRelase_item.dart';
import 'package:movies_app/model/popular.dart';

class NewRelaseWidget extends StatelessWidget {
  Movies? topMovies;

  NewRelaseWidget(this.topMovies);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Color.fromRGBO(40, 42, 40, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Releases ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  NewRelaseItem(topMovies, index),
              itemCount: topMovies!.results!.length,
            ),
          ),
        ],
      ),
    );
  }
}
