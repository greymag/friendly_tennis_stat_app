import 'package:get_it/get_it.dart';
import 'package:innim_lib/database.dart';
import 'package:tennis_stat/repositories/core/local_store.dart';
import 'package:tennis_stat/repositories/player/player_local_provider.dart';

import 'config.dart';

class DependencyInjectionInitializer {
  static void initialize(AppConfig config) {
    _registerCommon(config);
    _registerProviders();
  }

  static void _registerCommon(AppConfig config) {
    final di = GetIt.instance;
    di.registerSingleton(LocalStore());
    di.registerSingletonAlias<LocalDatabase, LocalStore>();
  }

  static void _registerProviders() {
    final di = GetIt.instance;
    final db = di.get<LocalStore>();

    di.registerLazySingleton(() => PlayerLocalProvider(db));
  }

  DependencyInjectionInitializer._();
}

extension GetItExtension on GetIt {
  void registerSingletonAlias<TAlias, TImpl extends TAlias>() {
    registerLazySingleton<TAlias>(() => get<TImpl>());
  }
}
