part of 'game_day_bloc.dart';

@immutable
abstract class GameDayState extends Equatable {
  const GameDayState();

  @override
  bool get stringify => true;
}

class GameDayInitial extends GameDayState {
  const GameDayInitial();

  @override
  List<Object> get props => const [];
}

class GameDayLoadInProgress extends GameDayState {
  const GameDayLoadInProgress();

  @override
  List<Object> get props => const [];
}

class GameDayLoadSuccess extends GameDayState {
  final List<Player> players;

  const GameDayLoadSuccess(this.players) : assert(players != null);

  @override
  List<Object> get props => [players];
}
