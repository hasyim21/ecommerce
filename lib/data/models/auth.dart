import 'package:equatable/equatable.dart';

import 'user.dart';

class Auth extends Equatable {
  final String jwt;
  final User user;

  const Auth({
    required this.jwt,
    required this.user,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        jwt: json["jwt"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
      };

  @override
  List<Object> get props => [jwt, user];
}
