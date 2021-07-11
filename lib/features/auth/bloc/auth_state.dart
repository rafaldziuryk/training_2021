part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class LoggedOutAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggedInAuthState extends AuthState {
  @override
  List<Object> get props => [];
}
