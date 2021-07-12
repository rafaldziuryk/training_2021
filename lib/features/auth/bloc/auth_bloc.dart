import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_training/features/auth/model/user.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoggedOutAuthState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
     if (event is AuthLoginEvent) {
      yield* loginEvent(event.user);
    }
  }

    Stream<AuthState> loginEvent(User user) async* {
    yield LoggedInAuthState();
  }
}
