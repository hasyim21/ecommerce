import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String email;
  final String? name;
  final String? phoneNumber;
  final Address? address;

  const User({
    required this.id,
    required this.username,
    required this.email,
    this.name,
    this.phoneNumber,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        name: json["name"] ?? '-',
        phoneNumber: json["phoneNumber"] ?? '-',
        address:
            json["address"] != null ? Address.fromJson(json["address"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "name": name,
        "phoneNumber": phoneNumber,
        "address": address?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      username,
      email,
      name,
      phoneNumber,
      address,
    ];
  }
}

class Address extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String otherDetails;

  const Address({
    required this.fullName,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.otherDetails,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
        country: json["country"],
        otherDetails: json["otherDetails"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "street": street,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "country": country,
        "otherDetails": otherDetails,
      };

  @override
  List<Object> get props {
    return [
      fullName,
      phoneNumber,
      street,
      city,
      state,
      postalCode,
      country,
      otherDetails,
    ];
  }

  @override
  String toString() {
    return 'Address(fullName: $fullName, phoneNumber: $phoneNumber, street: $street, city: $city, state: $state, postalCode: $postalCode, country: $country, otherDetails: $otherDetails)';
  }
}
