import 'package:json_annotation/json_annotation.dart';

part 'relief_user.g.dart';

@JsonSerializable(nullable: false)
class ReliefUser {
  @JsonKey(name: "objectId")
  final String uid;
  @JsonKey(name: "name")
  final String username;
  final String password;
  final String email;
  final String countryTag;
  final String pictureUrl;
  final int availableSessions;
  @JsonKey(name: "user-token")
  final String token;

  ReliefUser(
      {this.uid,
      this.username,
      this.password,
      this.email,
      this.countryTag,
      this.pictureUrl,
      this.availableSessions,
      this.token});

  factory ReliefUser.fromJson(Map<String, dynamic> json) =>
      _$ReliefUserFromJson(json);

  Map<String, dynamic> toJson() => _$ReliefUserToJson(this);

  @override
  String toString() {
    return 'User[uid: $uid, username: $username, email: $email, countryTag: $countryTag, pictureUrl: $pictureUrl, availableSessions: $availableSessions, token: $token]';
  }
}
