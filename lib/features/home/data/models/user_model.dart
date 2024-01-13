import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? uId;
  final String? name;
  final String? email;
  final String? password;
  final String? image;
  final DateTime? lastActive;
  final String? description;
  final bool? isOnline;

  UserModel({
    this.uId,
    this.name,
    this.email,
    this.password,
    this.image,
    this.lastActive,
    this.description,
    this.isOnline,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
