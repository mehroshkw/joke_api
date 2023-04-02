import 'dart:convert';

import 'package:api_get/joke_model.dart';
import 'package:http/http.dart' as http;

class JokeApi {
  Future<Jokemodel?> getJoke(String keyword) async {
    var url = Uri.parse("https://v2.jokeapi.dev/joke/Any?$keyword");
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        return Jokemodel.fromJson(jsonDecode(response.body));
      }
      print(response.body.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
