import 'package:get_it/get_it.dart';

import 'config.dart';

class DependencyInjectionInitializer {
  static void initialize(AppConfig config) {
    _registerCommon(config);
    _registerProviders();
  }

  static void _registerCommon(AppConfig config) {
    // final di = GetIt.instance;

    //di.registerSingleton(ApplicationPathProvider());
    //di.registerSingleton(LocalStore(di.get<ApplicationPathProvider>()));
    //di.registerSingletonAlias<LocalDatabase, LocalStore>();
  }

  static void _registerProviders() {
    // final di = GetIt.instance;
    // final db = di.get<LocalStore>();
  }

  DependencyInjectionInitializer._();
}

extension GetItExtension on GetIt {
  void registerSingletonAlias<TAlias, TImpl extends TAlias>() {
    registerLazySingleton<TAlias>(() => get<TImpl>());
  }
}
