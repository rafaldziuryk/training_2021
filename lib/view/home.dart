import 'package:flutter/material.dart';
import 'package:flutter_training/view/home_body.dart';
import 'package:flutter_training/view/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: HomeBody(selectedItem),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Zaloguj 1"),
                  onTap: () {
                    Navigator.of(context).popAndPushNamed("/login");
                  }),
              ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Zaloguj 2"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => LoginPage()));
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        onTap: (selected) {
          setState(() {
            selectedItem = selected;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Ekran 1"),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Ekran 2"),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Ekran 3"),
        ],
      ),
    );
  }
}
