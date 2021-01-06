import 'package:flutter/material.dart';
import 'package:innim_lib/innim_lib.dart';

import 'app.dart';
import 'config.dart';

Future<void> runAppWith(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  runWith(
    config: config,
    app: TennisStatApp(config),
    onError: (exception, stack) {
      debugPrint('Error: $exception');
    },
  );
}
