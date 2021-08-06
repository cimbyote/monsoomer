import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:monsoomer/models/media.dart';
import 'package:monsoomer/models/seriesDetailsFromAPI.dart';
import 'package:monsoomer/models/user_info_model.dart';
import 'package:provider/provider.dart';
import 'package:monsoomer/models/mediaFromAPI.dart';

class APIService {
  late String key = '';

  APIService();

  String parseSearch(String searchedTerm) {
    return replaceWhitespacesUsingRegex(searchedTerm, '%20');
  }

  String replaceWhitespacesUsingRegex(String s, String replace) {
    // This pattern means "at least one space, or more"
    // \\s : space
    // +   : one or more
    final pattern = RegExp('\\s+');
    return s.replaceAll(pattern, replace);
  }

  Future getData(String searchedTerm) async {
    final String url =
        'https://movie-database-imdb-alternative.p.rapidapi.com/?s=';
    final String search = parseSearch(searchedTerm);
    final String searchTags = '&r=json&page=1';

    print(url);

    var urlParse = Uri.parse(url + search + searchTags);
    Map<String, String> apiHeaders = {
      "x-rapidapi-key": key,
      "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com"
    };

    http.Response response = await http.get(urlParse, headers: apiHeaders);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      return jsonDecode(data);
    } else if (response.statusCode == 401) {
      print("Unauthorized API Key");
    } else if (response.statusCode == 403) {
      print("Forbidden");
    } else {
      print(response.statusCode);
    }
  }

  Future<List<MediaFromAPI>> searchAPI(String searchedTerm) async {
    var theData = await getData(searchedTerm);
    List<MediaFromAPI> searchResults = [];

    if (theData['Response'] == 'True') {
      print("the length of the data: " + theData['totalResults']);

      //API returns 10 results per page

      int length = int.parse(theData['totalResults']);

      int displayResultLength = 0;
      if (length > 10) {
        displayResultLength = 10;
      } else {
        displayResultLength = length;
      }

      for (int i = 0; i < displayResultLength; i++) {
        MediaFromAPI temp = MediaFromAPI(
            title: theData['Search'][i]['Title'],
            year: theData['Search'][i]['Year'],
            id: theData['Search'][i]['imdbID'],
            type: theData['Search'][i]['Type'],
            imageString: theData['Search'][i]['Poster']);
        searchResults.add(temp);
      }
    } else {
      print("the results came back false");
    }

    return searchResults;
  }

  Future<SeriesDetailsFromAPI> searchAPIForDetailedInfo(String id) async {
    var theData = await getDetailedDataFromID(id);
    SeriesDetailsFromAPI temp = SeriesDetailsFromAPI();
    if (theData['Response'] == 'True') {

      temp = SeriesDetailsFromAPI(
        title: theData['Title'],
        year: theData['Year'],
        rated: theData['Rated'],
        released: theData['Released'],
        runtime: theData['Runtime'],
        genre: theData['Genre'],
        director: theData['Director'],
        writer: theData['Writer'],
        actors: theData['Actors'],
        plot: theData['Plot'],
        language: theData['Language'],
        country: theData['Country'],
        awards: theData['Awards'],
        poster: theData['Poster'],
        imdbRating: theData['imdbRatings'],
        imdbVotes: theData['imdbVotes'],
        imdbID: theData['imdbID'],
        type: theData['Type'],
        totalSeasons: theData['totalSeasons'],
      );
    } else {
      print("the results came back false");
    }

    return temp;
  }

  Future getDetailedDataFromID(String id) async {

    https://movie-database-imdb-alternative.p.rapidapi.com/?r=json&i=tt0149460

    final String url =
        'https://movie-database-imdb-alternative.p.rapidapi.com/?r=json&i=';
    final String search = id;

    print(url);

    var urlParse = Uri.parse(url + id);
    Map<String, String> apiHeaders = {
      "x-rapidapi-key": key,
      "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com"
    };

    http.Response response = await http.get(urlParse, headers: apiHeaders);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      return jsonDecode(data);
    } else if (response.statusCode == 401) {
      print("Unauthorized API Key");
    } else if (response.statusCode == 403) {
      print("Forbidden");
    } else {
      print(response.statusCode);
    }
  }
}
