import 'package:innim_lib/database.dart';
import 'package:tennis_stat/models/models.dart';

class PlayerLocalProvider extends LocalProviderBase {
  PlayerLocalProvider(LocalDatabase databaseWrapper)
      : super(databaseWrapper, 'player');

  Future<List<Player>> getList() async {
    // TMP
    return [
      Player(uid: 'a', firstName: 'Novak', lastName: 'Djokovic'),
      Player(uid: 'b', firstName: 'Rafael', lastName: 'Nadal'),
      Player(uid: 'c', firstName: 'Dominic', lastName: 'Thiem'),
      Player(uid: 'd', firstName: 'Daniil', lastName: 'Medvedev'),
      Player(uid: 'e', firstName: 'Roger', lastName: 'Federer'),
      Player(uid: 'f', firstName: 'Stefanos', lastName: 'Tsitsipas'),
    ];
  }
}
