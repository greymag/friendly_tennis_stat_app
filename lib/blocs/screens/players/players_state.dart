part of 'players_bloc.dart';

@immutable
abstract class PlayersState extends Equatable {
  const PlayersState();

  @override
  bool get stringify => true;
}

class PlayersInitial extends PlayersState {
  const PlayersInitial();

  @override
  List<Object> get props => const [];
}

class PlayersLoadInProgress extends PlayersState {
  const PlayersLoadInProgress();

  @override
  List<Object> get props => const [];
}

class PlayersLoadSuccess extends PlayersState {
  final List<Player> players;

  const PlayersLoadSuccess(this.players) : assert(players != null);

  @override
  List<Object> get props => [players];
}
