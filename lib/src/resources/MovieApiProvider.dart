import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../models/ItemModel.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'api-key';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchMovieList() async {
    Response response;
    if(_apiKey != 'api-key') {
       response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    }else{
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
