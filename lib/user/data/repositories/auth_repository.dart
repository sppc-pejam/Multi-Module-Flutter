import '../../../core/services/local/hive_service.dart';

class AuthRepository {
  final HiveService _hiveService;

  AuthRepository(this._hiveService);

  Future<String?> login(String username, String password) async {
    // شبیه‌سازی درخواست ورود به سرور
    if (username == "admin" && password == "1234") {
      return "mock_token_123"; // بازگرداندن یک توکن تستی
    }
    return null;
  }

  void saveToken(String token) {
    _hiveService.saveToken(token);
  }

  String? getToken() {
    return _hiveService.getToken();
  }

  void logout() {
    _hiveService.clearToken();
  }
}
