import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/features/login/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  late LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Logowanie"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Container(
                      height: 16.0,
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term'),
                    ),
                    Container(
                      height: 16.0,
                    ),
                    TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                          labelText: "LastName",
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term'),
                    ),
                    Container(
                      height: 16.0,
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (BuildContext context, LoginState state) {
                        if (state is InitialLoginState) {
                          return Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                child: Center(
                                  child: Text("Login"),
                                ),
                                onTap: () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      TryToLoginEvent(nameController.text,
                                          lastNameController.text));
                                },
                              ),
                            ),
                          );
                        } else if (state is LoginInProgress) {
                          return Container(
                              height: 50.0, child: Center(child: CircularProgressIndicator()));
                        } else {
                          return Container();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }
}
