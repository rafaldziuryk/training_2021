part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class TryToLoginEvent extends LoginEvent {

  final String name;
  final String lastName;

  TryToLoginEvent(this.name, this.lastName);

  @override
  List<Object> get props => [name, lastName];

}
