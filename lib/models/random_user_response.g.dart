// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomUserResponse _$RandomUserResponseFromJson(Map<String, dynamic> json) =>
    RandomUserResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RandomUserResponseToJson(RandomUserResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      avatar: json['avatar'] as String,
      username: json['username'] as String,
      knownIps:
          (json['knownIps'] as List<dynamic>).map((e) => e as String).toList(),
      lastLoginAttempt: json['lastLoginAttempt'] as String,
      lastLoginIp: json['lastLoginIp'] as String,
      department: json['department'] as String,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      staticData: (json['staticData'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'avatar': instance.avatar,
      'username': instance.username,
      'knownIps': instance.knownIps,
      'lastLoginAttempt': instance.lastLoginAttempt,
      'lastLoginIp': instance.lastLoginIp,
      'department': instance.department,
      'profile': instance.profile,
      'staticData': instance.staticData,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
