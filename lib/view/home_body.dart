import 'package:flutter/material.dart';
import 'package:flutter_training/view/passenger_page.dart';

class HomeBody extends StatelessWidget {
  const HomeBody(this.selectedIndex, {Key? key}) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return PokemonsPage();
      case 1:
        return PokemonsPage();
      case 2:
        return PokemonsPage();
      default:
        return PokemonsPage();
    }
  }
}
