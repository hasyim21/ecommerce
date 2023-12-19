import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String email;
  final String? fullName;
  final String? phoneNumber;
  final Address? address;

  const User({
    required this.id,
    required this.username,
    required this.email,
    this.fullName,
    this.phoneNumber,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        fullName: json["fullName"] ?? '-',
        phoneNumber: json["phoneNumber"] ?? '-',
        address:
            json["address"] != null ? Address.fromJson(json["address"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "address": address?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      username,
      email,
      fullName,
      phoneNumber,
      address,
    ];
  }
}

class Address extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String subdistrict;
  final String regency;
  final String province;
  final String postalCode;
  final String otherDetails;

  const Address({
    required this.fullName,
    required this.phoneNumber,
    required this.subdistrict,
    required this.regency,
    required this.province,
    required this.postalCode,
    required this.otherDetails,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        subdistrict: json["subdistrict"],
        regency: json["regency"],
        province: json["province"],
        postalCode: json["postalCode"],
        otherDetails: json["otherDetails"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "subdistrict": subdistrict,
        "regency": regency,
        "province": province,
        "postalCode": postalCode,
        "otherDetails": otherDetails,
      };

  @override
  List<Object> get props {
    return [
      fullName,
      phoneNumber,
      subdistrict,
      regency,
      province,
      postalCode,
      otherDetails,
    ];
  }

  @override
  String toString() {
    return 'Address(fullName: $fullName, phoneNumber: $phoneNumber, subdistrict: $subdistrict, regency: $regency, province: $province, postalCode: $postalCode, otherDetails: $otherDetails)';
  }
}
