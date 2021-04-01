import 'package:json_annotation/json_annotation.dart';

part 'registration_response.g.dart';

enum RegistrationStatus { EMAIL_CONFIRMATION_PENDING, ENABLED, DEFAULT }

@JsonSerializable(nullable: false)
class RegistrationResponse {
  @JsonKey(name: "userStatus")
  final String status;

  RegistrationResponse({this.status});

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);

  @override
  String toString() {
    return 'RegistrationResponse[status: $status]';
  }
}
