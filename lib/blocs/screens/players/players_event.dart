part of 'players_bloc.dart';

@immutable
abstract class PlayersEvent extends Equatable {
  const PlayersEvent();

  @override
  bool get stringify => true;
}

class PlayersShown extends PlayersEvent {
  const PlayersShown();

  @override
  List<Object> get props => [];
}
