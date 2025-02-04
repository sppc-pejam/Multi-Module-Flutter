import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:multi_module_flutter/core/data/models/user_model.dart';

class UserLocalDataSource {
  Future<UserModel> getUser() async {
    final String response = await rootBundle.loadString('json/user.json');
    final Map<String, dynamic> data = json.decode(response);
    return UserModel.fromJson(data);
  }
}
