import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _tokenBox = 'tokenBox'; // نام جعبه ذخیره‌سازی توکن
  static const String _tokenKey = 'token'; // کلید مربوط به توکن

  late Box _box; // جعبه Hive برای ذخیره‌سازی داده‌ها

  /// مقداردهی اولیه Hive
  Future<void> init() async {
    await Hive.initFlutter(); // مقداردهی اولیه Hive
    _box = await Hive.openBox(_tokenBox); // باز کردن جعبه با نام مشخص شده
  }

  /// ذخیره کردن توکن در Hive
  Future<void> saveToken(String token) async {
    await _box.put(_tokenKey, token);
  }

  /// دریافت توکن از Hive
  String? getToken() {
    return _box.get(_tokenKey);
  }

  /// حذف توکن (برای خروج از حساب)
  Future<void> clearToken() async {
    await _box.delete(_tokenKey);
  }
}
