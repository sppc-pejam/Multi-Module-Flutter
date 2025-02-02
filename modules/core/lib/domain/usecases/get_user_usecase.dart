import 'package:core/domain/entities/user.dart';
import 'package:core/domain/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<User> call() {
    return repository.getUser();
  }
}
