import 'package:flutter/material.dart';
import 'package:flutter_training/features/pokemons/model/pokemon.dart';
import 'package:flutter_training/view/pokemon_grid_item.dart';
import 'package:hive/hive.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  _PokemonsPageState createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: getPokemons(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
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
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    final element = snapshot.data![index];
                    return PokemonGridItem(element);
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

  Future<List<Pokemon>> getPokemons() async {
    final _pokemonBox = await Hive.openBox<Pokemon>('pokemon');
    final pokemons = _pokemonBox.values.toList();
    return pokemons;
  }
}
