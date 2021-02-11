part of 'game_day_bloc.dart';

@immutable
abstract class GameDayEvent extends Equatable {
  const GameDayEvent();

  @override
  bool get stringify => true;
}

class GameDayShown extends GameDayEvent {
  const GameDayShown();

  @override
  List<Object> get props => [];
}
