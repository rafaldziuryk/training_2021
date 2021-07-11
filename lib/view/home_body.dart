import 'package:flutter/material.dart';
import 'package:flutter_training/view/screen1.dart';

class HomeBody extends StatelessWidget {
  const HomeBody(this.selectedIndex, {Key? key}) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return Screen1();
      case 1:
        return Screen1();
      case 2:
        return Screen1();
      default:
        return Screen1();
    }
  }
}
