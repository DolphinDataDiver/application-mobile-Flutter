import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final Profile profile;
  final String username;
  final String department;
  final String avatar;
  final List<String> knownIps;
  final String lastLoginAttempt;
  final String lastLoginIp;
  final Map<String, dynamic> staticData;

  User({
    required this.profile,
    required this.username,
    required this.department,
    required this.avatar,
    required this.knownIps,
    required this.lastLoginAttempt,
    required this.lastLoginIp,
    required this.staticData,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Profile {
  final String firstName;
  final String lastName;
  final String email;

  Profile({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

