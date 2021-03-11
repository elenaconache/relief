// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReliefUser _$UserFromJson(Map<String, dynamic> json) {
  return ReliefUser(
    json['uid'] as String,
    json['username'] as String,
    json['password'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['countryTag'] as String,
    json['pictureUrl'] as String,
    json['availableSessions'] as int,
  );
}

Map<String, dynamic> _$UserToJson(ReliefUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'phone': instance.phone,
      'countryTag': instance.countryTag,
      'pictureUrl': instance.pictureUrl,
      'availableSessions': instance.availableSessions,
    };
