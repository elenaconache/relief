import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable(nullable: false)
class RegisterBody {
  final String email;
  final String password;
  final String name;

  RegisterBody({this.email, this.password, this.name});

  factory RegisterBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterBodyToJson(this);

  @override
  String toString() {
    return 'RegisterBody[email: $email, name: $name]';
  }
}
