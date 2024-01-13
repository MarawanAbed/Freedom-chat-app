// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uId: json['uId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      image: json['image'] as String?,
      lastActive: json['lastActive'] == null
          ? null
          : DateTime.parse(json['lastActive'] as String),
      description: json['description'] as String?,
      isOnline: json['isOnline'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uId': instance.uId,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'image': instance.image,
      'lastActive': instance.lastActive?.toIso8601String(),
      'description': instance.description,
      'isOnline': instance.isOnline,
    };
