part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable{}

class LoginEvent extends AuthEvent {

  final User user;

  LoginEvent(this.user);

  @override
  List<Object> get props => [user];
}