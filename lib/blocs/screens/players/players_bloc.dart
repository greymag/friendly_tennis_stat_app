import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:innim_lib/innim_lib.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_stat/models/models.dart';
import 'package:tennis_stat/repositories/respositories.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  final PlayerRepository playerRepository;

  PlayersBloc(this.playerRepository)
      : assert(playerRepository != null),
        super(const PlayersInitial());

  @override
  Stream<PlayersState> mapEventToState(PlayersEvent event) async* {
    if (event is PlayersShown) {
      yield* _mapShownToState(event);
    } else {
      debugAssertUnhandledEvent(event);
    }
  }

  Stream<PlayersState> _mapShownToState(PlayersShown event) async* {
    yield const PlayersLoadInProgress();
    final list = await playerRepository.getList();
    yield PlayersLoadSuccess(list);
  }
}

extension PlayersBlocExtension on PlayersBloc {
  void shown() => add(const PlayersShown());
}
