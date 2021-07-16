import 'package:flutter/material.dart';
import 'package:flutter_training/features/pokemons/model/pokemon.dart';
import 'package:flutter_training/extensions/string+capitalise_extension.dart';

class PokemonGridItem extends StatefulWidget {
  const PokemonGridItem(this.pokemon, {Key? key}) : super(key: key);

  final Pokemon pokemon;

  @override
  _PokemonGridItemState createState() => _PokemonGridItemState();
}

class _PokemonGridItemState extends State<PokemonGridItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size.width;


    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hover = true;
        });
      },
      onExit: (_) {
        setState(() {
          hover = false;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: [
              Positioned(
                height: 400,
                bottom:50,
                left: -80,
                right: -20,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      gradient: LinearGradient(colors: [
                        hover ? Colors.pink.shade300 : Colors.pink.shade100,
                        hover ? Colors.purple.shade300 : Colors.purple.shade100,
                      ])),
                ),
              ),
              Positioned(
                height: 350,
                bottom: 70,
                left: -35,
                right: -5,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      gradient: LinearGradient(colors: [
                        hover ? Colors.pink.shade500 : Colors.pink.shade300,
                        hover ? Colors.purple.shade500 : Colors.purple.shade300,
                      ])),
                ),
              ),
              Positioned.fill(
                  child: Center(
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: hover ? 250 : 200,
                    height: hover ? 250 : 200,
                    child: Image.network(
                      widget.pokemon.image,
                      fit: BoxFit.fill,
                    )),
              )),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(widget.pokemon.name.capitalize(), style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('#${widget.pokemon.id.padLeft(3, '0')}', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),),
                    ),
                  ],
                ),
              ),
              Positioned(child: AnimatedIcon(icon: AnimatedIcons.add_event,))
            ],
          ),
        ),
      ),
    );
  }
}
