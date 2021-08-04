import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:monsoomer/models/media.dart';
import 'package:monsoomer/models/user_info_model.dart';
import 'package:provider/provider.dart';

class APIService
{
  late String key;

  APIService();

  Future getData() async {
    final String url = 'https://movie-database-imdb-alternative.p.rapidapi.com/?s=Avengers%20Age&r=json&page=1';

    print(url);

    var urlParse = Uri.parse(url);
    Map<String, String> apiHeaders = {
      "x-rapidapi-key": key,
      "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com"
    };

    http.Response response = await http.get(urlParse, headers: apiHeaders);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      return jsonDecode(data);
    }
    else if (response.statusCode == 401) {
      print("Unauthorized API Key");
    }
    else if (response.statusCode == 403) {
      print("Forbidden");
    }
    else {
      print(response.statusCode);
    }
  }

}