import 'package:flutter/material.dart';
import 'package:flutter_training/features/pokemons/model/pokemon.dart';

class PokemonGridItem extends StatelessWidget {
  const PokemonGridItem(this.pokemon, {Key? key}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    print(size);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Positioned(
              height: 400,
              bottom: 30,
              left: -80,
              right: -20,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    gradient: LinearGradient(colors: [
                      Colors.pink.shade100,
                      Colors.purple.shade100,
                    ])),
              ),
            ),
            Positioned(
              height: 350,
              bottom: 50,
              left: -35,
              right: -5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    gradient: LinearGradient(colors: [
                      Colors.pink.shade300,
                      Colors.purple.shade300,
                    ])),
              ),
            ),
            Positioned.fill(
                child: Center(
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.network(
                    pokemon.image,
                    fit: BoxFit.fill,
                  )),
            )),
            Positioned(right: 0, left: 0, bottom: 0, height: 50, child: Row(children: [
              Text(pokemon.name),
                            Text('#${pokemon.id.padLeft(3, '0')}'),

            ],),)
          ],
        ),
      ),
    );
  }
}
