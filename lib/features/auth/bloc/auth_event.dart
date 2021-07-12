part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable{}

class AuthLoginEvent extends AuthEvent {

  final User user;

  AuthLoginEvent(this.user);

  @override
  List<Object> get props => [user];
}