

import 'package:multi_module_flutter/core/data/datasources/user_local_data_source.dart';
import 'package:multi_module_flutter/core/data/models/user_model.dart';
import 'package:multi_module_flutter/core/domain/entities/user.dart';
import 'package:multi_module_flutter/core/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<User> getUser() async {
    final UserModel model = await localDataSource.getUser();
    return model.toEntity();
  }
}


