import '../../data/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<bool> execute(String username, String password) async {
    print(username + " " + password);
    final token = await _authRepository.login(username, password);
    if (token != null) {
      // ذخیره توکن در Hive
      _authRepository.saveToken(token);
      return true;
    }
    return false;
  }
}
