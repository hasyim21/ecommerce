part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class DoLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const DoLoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'DoLogin(email: $email, password: $password)';
}
