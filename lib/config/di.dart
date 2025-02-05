import 'package:get_it/get_it.dart';
import '../core/services/local/hive_service.dart';
import '../user/data/repositories/auth_repository.dart';
import '../user/domain/usecases/login_usecase.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // ثبت HiveService و مقداردهی اولیه آن
  final hiveService = HiveService();
  await hiveService.init();
  getIt.registerLazySingleton<HiveService>(() => hiveService);

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<HiveService>()));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt<AuthRepository>()));
}
