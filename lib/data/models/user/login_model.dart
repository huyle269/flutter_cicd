import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginModel {
  LoginModel(
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.fullName,
    this.userRole,
    this.userName,
    this.email,
  );

  final String accessToken;
  final String tokenType;
  final String refreshToken;
  final int expiresIn;
  @JsonKey(name: 'fullName')
  final String fullName;
  @JsonKey(name: 'userRole')
  final List<String> userRole;
  @JsonKey(name: 'userName')
  final String userName;
  @JsonKey(name: 'email')
  final String email;

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
