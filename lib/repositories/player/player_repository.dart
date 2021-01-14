import 'package:flutter/material.dart';
import 'package:tennis_stat/models/models.dart';
import 'package:tennis_stat/repositories/player/player_local_provider.dart';

class PlayerRepository {
  @protected
  final PlayerLocalProvider local;

  PlayerRepository(this.local) : assert(local != null);

  Future<List<Player>> getList() => local.getList();
}
