part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  bool get stringify => true;
}

class AppShown extends AppEvent {
  const AppShown();

  @override
  List<Object> get props => const [];
}

class AppLaunchScreenHidden extends AppEvent {
  const AppLaunchScreenHidden();

  @override
  List<Object> get props => const [];
}
