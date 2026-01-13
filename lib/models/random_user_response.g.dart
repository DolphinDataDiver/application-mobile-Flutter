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
