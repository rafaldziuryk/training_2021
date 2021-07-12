import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/features/auth/bloc/auth_bloc.dart';
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
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoggedInAuthState) {
                return Column(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Wyloguj 1"),
                        onTap: () {
                          Navigator.of(context).popAndPushNamed("/");
                          BlocProvider.of<AuthBloc>(context)
                              .add(AuthLogOutEvent());
                        }),
                    ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Wyloguj 2"),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => HomePage()));
                          BlocProvider.of<AuthBloc>(context)
                              .add(AuthLogOutEvent());
                        }),
                  ],
                );
              } else if (state is LoggedOutAuthState) {
                return Column(
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
                );
              } else {
                return Container();
              }
            },
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
