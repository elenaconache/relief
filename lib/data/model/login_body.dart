import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable(nullable: false)
class LoginBody {
  final String login;
  final String password;

  LoginBody({this.login, this.password});

  factory LoginBody.fromJson(Map<String, dynamic> json) =>
      _$LoginBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);

  @override
  String toString() {
    return 'LoginBody[login: $login]';
  }
}
