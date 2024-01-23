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
      lastActive: const TimestampConverter().fromJson(json['lastActive']),
      description: json['description'] as String?,
      isOnline: UserModel._fromJsonBool(json['isOnline']),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uId': instance.uId,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'image': instance.image,
      'lastActive': const TimestampConverter().toJson(instance.lastActive),
      'description': instance.description,
      'isOnline': instance.isOnline,
    };
