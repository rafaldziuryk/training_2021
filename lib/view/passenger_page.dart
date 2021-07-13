import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: getPokemons(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return SizedBox.shrink();
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final element = snapshot.data![index];
                    final name = element['name'];
                    final url = Uri.parse(element['url']);
                    final id = url.pathSegments.lastWhere((element) => element.isNotEmpty);
                    return ListTile(
                      title: Text(name),
                      leading: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png'),
                    );
                  },
                  itemCount: snapshot.data?.length ?? 0,
                );
              } else {
                return SizedBox.shrink();
              }
            default:
              return SizedBox.shrink();
          }
        });
  }

  Future<List<dynamic>> getPokemons() async {
    var url = Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?limit=50&offset=0');
    var response = await http.get(url);
    final Map<String, dynamic> parsed = json.decode(response.body);
    return parsed['results'];
  }
}
