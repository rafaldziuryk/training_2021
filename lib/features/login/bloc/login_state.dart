part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {

  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {

  final String errorMessage;

  LoginError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoginInProgress extends LoginState {

  @override
  List<Object> get props => [];
}

