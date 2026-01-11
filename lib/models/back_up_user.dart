import 'package:json_annotation/json_annotation.dart';


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
}

@JsonSerializable()
class User {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final Dob dob;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'],
      name: Name.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'],
      dob: Dob.fromJson(json['dob']),
    );
  }
}

@JsonSerializable()
class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}


@JsonSerializable()
class Location {
  final String city;
  final String state;
  final String country;

  Location({
    required this.city,
    required this.state,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
      state: json['state'],
      country: json['country'],
    );
  }
}


@JsonSerializable()
class Dob {
  final String date;
  final int age;

  Dob({
    required this.date,
    required this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      date: json['date'],
      age: json['age'],
    );
  }
}
