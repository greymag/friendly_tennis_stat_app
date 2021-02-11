import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innim_lib/innim_lib.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_stat/models/models.dart';

part 'game_day_event.dart';
part 'game_day_state.dart';

class GameDayBloc extends Bloc<GameDayEvent, GameDayState> {
  GameDayBloc() : super(const GameDayInitial());

  @override
  Stream<GameDayState> mapEventToState(GameDayEvent event) async* {
    if (event is GameDayShown) {
      yield* _mapShownToState(event);
    } else {
      debugAssertUnhandledEvent(event);
    }
  }

  Stream<GameDayState> _mapShownToState(GameDayShown event) async* {
    yield const GameDayLoadInProgress();
    // TODO: load players for the day
    final list = <Player>[];
    yield GameDayLoadSuccess(list);
  }
}

extension GameDayBlocExtension on GameDayBloc {
  void shown() => add(const GameDayShown());
}

extension GameDayBlocBuildContextExtension on BuildContext {
  void get gameDay => BlocProvider.of(this);
}
