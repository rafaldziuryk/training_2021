import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/features/pokemons/model/pokemon.dart';
import 'package:flutter_training/view/home.dart';
import 'package:flutter_training/view/login.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;

void main() async {
  if (!kIsWeb) {
    final documentsDirectory =
        await PathProvider.getApplicationDocumentsDirectory();
    Hive.init(documentsDirectory.path);
  }
  Hive.registerAdapter(PokemonAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/login":
            return MaterialPageRoute(
                builder: (BuildContext context) => LoginPage());
          default:
            return MaterialPageRoute(
                builder: (BuildContext context) => HomePage());
        }
      },
      home: HomePage(),
    );
  }
}
