import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/apiConstants.dart';
import 'package:movies_app/home/HomeResponse/PopularResponse.dart';
import 'package:movies_app/home/HomeResponse/RecommendedResponse.dart';
import 'package:movies_app/home/HomeResponse/UpcomingResponse.dart';

class ApiManager {
  static Future<PopularResponse> getPopularMovies() async {
    Uri url = Uri.https(ApiConstants.basicUrl, ApiConstants.popularMoviesUrl,
        {'api_key': 'aa543da3f03a867955637b64e3a81569'});

    try {
      final response = await http.get(url);
      var bodyResponse = response.body;
      var json = jsonDecode(bodyResponse);
      return PopularResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<UpcomingResponse> getUpcomingMovies() async {
    Uri url = Uri.https(ApiConstants.basicUrl, ApiConstants.upcomingMoviesUrl,
        {'api_key': 'aa543da3f03a867955637b64e3a81569'});

    try {
      final response = await http.get(url);
      var bodyResponse = response.body;
      var json = jsonDecode(bodyResponse);
      return UpcomingResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<RecommendedResponse> getRecommendedMovies() async {
    Uri url = Uri.https(ApiConstants.basicUrl, ApiConstants.recommendMoviesUrl,
        {'api_key': 'aa543da3f03a867955637b64e3a81569'});

    try {
      final response = await http.get(url);
      var bodyResponse = response.body;
      var json = jsonDecode(bodyResponse);
      return RecommendedResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
