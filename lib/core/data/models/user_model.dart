

import 'package:multi_module_flutter/core/domain/entities/user.dart';

class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  // تبدیل از JSON به مدل
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  // تبدیل مدل به JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  // تبدیل مدل به انتیتی
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
    );
  }

  // ساخت مدل از انتیتی
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }
}
