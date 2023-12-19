part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {}

class UpdateProfileEvent extends UserEvent {
  final String fullName;
  final String username;
  final String email;
  final String phoneNumber;

  const UpdateProfileEvent({
    required this.fullName,
    required this.username,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [fullName, username, email, phoneNumber];
}

class UpdateAddressEvent extends UserEvent {
  final Address address;

  const UpdateAddressEvent({
    required this.address,
  });

  @override
  List<Object> get props => [address];
}
