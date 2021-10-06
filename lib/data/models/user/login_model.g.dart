// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      json['access_token'] as String,
      json['token_type'] as String,
      json['refresh_token'] as String,
      json['expires_in'] as int,
      json['fullName'] as String,
      (json['userRole'] as List<dynamic>).map((e) => e as String).toList(),
      json['userName'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'fullName': instance.fullName,
      'userRole': instance.userRole,
      'userName': instance.userName,
      'email': instance.email,
    };
