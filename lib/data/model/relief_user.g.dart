// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relief_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReliefUser _$ReliefUserFromJson(Map<String, dynamic> json) {
  return ReliefUser(
    uid: json['objectId'] as String,
    username: json['name'] as String,
    password: json['password'] as String,
    email: json['email'] as String,
    countryTag: json['countryTag'] as String,
    pictureUrl: json['pictureUrl'] as String,
    availableSessions: json['availableSessions'] as int,
    token: json['user-token'] as String,
  );
}

Map<String, dynamic> _$ReliefUserToJson(ReliefUser instance) =>
    <String, dynamic>{
      'objectId': instance.uid,
      'name': instance.username,
      'password': instance.password,
      'email': instance.email,
      'countryTag': instance.countryTag,
      'pictureUrl': instance.pictureUrl,
      'availableSessions': instance.availableSessions,
      'user-token': instance.token,
    };
