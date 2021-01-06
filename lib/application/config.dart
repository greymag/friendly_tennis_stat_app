import 'package:flutter/widgets.dart';
import 'package:innim_lib/innim_lib.dart';

/// App configuration.
class AppConfig {
  static AppConfig of(BuildContext context) => AppConfigScope.of(context);

  AppConfig();

  factory AppConfig.byDefault() {
    return AppConfig();
  }

  factory AppConfig.production() {
    return AppConfig.byDefault();
  }

  factory AppConfig.dev() {
    return AppConfig.byDefault();
  }
}
