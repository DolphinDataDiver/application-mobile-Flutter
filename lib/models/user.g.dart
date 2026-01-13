// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      username: json['username'] as String,
      department: json['department'] as String,
      avatar: json['avatar'] as String,
      knownIps:
          (json['knownIps'] as List<dynamic>).map((e) => e as String).toList(),
      lastLoginAttempt: json['lastLoginAttempt'] as String,
      lastLoginIp: json['lastLoginIp'] as String,
      staticData: (json['staticData'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'profile': instance.profile,
      'username': instance.username,
      'department': instance.department,
      'avatar': instance.avatar,
      'knownIps': instance.knownIps,
      'lastLoginAttempt': instance.lastLoginAttempt,
      'lastLoginIp': instance.lastLoginIp,
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
