import 'package:json_annotation/json_annotation.dart';

part 'social_login_body.g.dart';

@JsonSerializable(nullable: false)
class SocialLoginBody {
  final String accessToken;

  SocialLoginBody({this.accessToken});

  factory SocialLoginBody.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLoginBodyToJson(this);

  @override
  String toString() {
    return 'SocialLoginBody[token: $accessToken]';
  }
}
