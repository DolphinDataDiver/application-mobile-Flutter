import 'package:json_annotation/json_annotation.dart';

part 'random_user_response.g.dart';

@JsonSerializable()
class RandomUserResponse {
  final List<User> results;

  RandomUserResponse({required this.results});

  factory RandomUserResponse.fromJson(Map<String, dynamic> json) {
    return RandomUserResponse(
      results: List<User>.from(
        json['results'].map((x) => User.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => _$RandomUserResponseToJson(this);
}

@JsonSerializable()
class User {
  final String id;
  final String createdAt;
  final String avatar;
  final String username;
  final List<String> knownIps;
  final String lastLoginAttempt;
  final String lastLoginIp;
  final String department;
  final Profile profile;
  final List<int> staticData;

  User({
    required this.id,
    required this.createdAt,
    required this.avatar,
    required this.username,
    required this.knownIps,
    required this.lastLoginAttempt,
    required this.lastLoginIp,
    required this.department,
    required this.profile,
    required this.staticData,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: json['createdAt'],
      avatar: json['avatar'],
      username: json['username'],
      knownIps: List<String>.from(json['knownIps']),
      lastLoginAttempt: json['lastLoginAttempt'],
      lastLoginIp: json['lastLoginIp'],
      department: json['department'],
      profile: Profile.fromJson(json['profile']),
      staticData: List<int>.from(json['staticData']),
    );
  }

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

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

