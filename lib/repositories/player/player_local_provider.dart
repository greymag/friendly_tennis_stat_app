import 'package:innim_lib/database.dart';

class PlayerLocalProvider extends LocalProviderBase {
  PlayerLocalProvider(LocalDatabase databaseWrapper)
      : super(databaseWrapper, 'player');
}
