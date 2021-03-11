import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: false)
class ReliefUser {
  final String uid;
  final String username;
  final String password;
  final String email;
  final String phone;
  final String countryTag;
  final String pictureUrl;
  final int availableSessions;

  ReliefUser(this.uid, this.username, this.password, this.email, this.phone,
      this.countryTag, this.pictureUrl, this.availableSessions);

  factory ReliefUser.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User[uid: $uid, username: $username, email: $email, phone: $phone, countryTag: $countryTag, pictureUrl: $pictureUrl, availableSessions: $availableSessions]';
  }
}
