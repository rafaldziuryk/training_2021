import 'package:dio/dio.dart';
import 'package:flutter_training/features/pokemons/model/pokemon_response.dart';

class Rest {
  static final Rest _rest = Rest._internal();

  late Dio dio;

  factory Rest() {
    return _rest;
  }

  Rest._internal() {
    dio = Dio(); // with default Options

    dio.options.baseUrl = 'https://pokeapi.co/api/v2';
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
  }

  Future<PokemonResponse> getPokemons(int pageKey) async {
    final response = await dio.get('/pokemon?limit=50&offset=$pageKey');
    return PokemonResponse.fromMap(response.data);
  }
}
