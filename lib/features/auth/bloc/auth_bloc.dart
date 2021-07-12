import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_training/features/auth/model/user.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoggedOutAuthState()) {
    add(AuthCheckEvent());
  }

  static const loginKey = "authorization.flag";

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthLoginEvent) {
      yield* loginEvent(event.user);
    } else if (event is AuthLogOutEvent) {
      yield* logoutEvent();
    } else if (event is AuthCheckEvent) {
      yield* checkLogin();
    }
  }

  Stream<AuthState> loginEvent(User user) async* {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(loginKey, true);
    yield LoggedInAuthState();
  }

  Stream<AuthState> logoutEvent() async* {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(loginKey, false);
    yield LoggedInAuthState();
  }

  Stream<AuthState> checkLogin() async* {
    final sharedPreferences = await SharedPreferences.getInstance();
    final isLogged = sharedPreferences.getBool(loginKey) ?? false;
    if (isLogged) {
      yield LoggedInAuthState();
    } else {
      yield LoggedOutAuthState();
    }
  }
}
