part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable{}

class AuthLoginEvent extends AuthEvent {

  final User user;

  AuthLoginEvent(this.user);

  @override
  List<Object> get props => [user];
}

class AuthLogOutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthCheckEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}