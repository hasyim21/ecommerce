part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class DoRegisterEvent extends RegisterEvent {
  final String username;
  final String email;
  final String password;

  const DoRegisterEvent(
      {required this.username, required this.email, required this.password});

  @override
  List<Object> get props => [username, email, password];

  @override
  String toString() =>
      'DoRegisterEvent(username: $username, email: $email, password: $password)';
}
