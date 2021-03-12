// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBody _$LoginBodyFromJson(Map<String, dynamic> json) {
  return LoginBody(
    login: json['login'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginBodyToJson(LoginBody instance) => <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
    };
