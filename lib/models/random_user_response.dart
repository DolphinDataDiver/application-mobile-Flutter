import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'random_user_response.g.dart';

@JsonSerializable()
class RandomUserResponse {
  final List<User> results;

  RandomUserResponse({required this.results});

  factory RandomUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RandomUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RandomUserResponseToJson(this);
}

