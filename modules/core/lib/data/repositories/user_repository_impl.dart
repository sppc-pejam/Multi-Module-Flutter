import 'package:core/domain/entities/user.dart';
import 'package:core/domain/repositories/user_repository.dart';
import 'package:core/data/datasources/user_local_data_source.dart';
import 'package:core/data/models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<User> getUser() async {
    final UserModel model = await localDataSource.getUser();
    return model.toEntity();
  }
}


