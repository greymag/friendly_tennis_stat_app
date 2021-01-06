import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:innim_lib/innim_lib.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppInitial());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppShown) {
      yield* _mapShownToState(event);
    } else if (event is AppLaunchScreenHidden) {
      yield* _mapLaunchScreenHiddenToState(event);
    } else {
      debugAssertUnhandledEvent(event);
    }
  }

  Stream<AppState> _mapShownToState(AppShown event) async* {
    yield const AppLoadInProgress();

    // TODO: load app
    // await Future.wait([
    // ], eagerError: true);

    yield const AppReady();

    yield const AppReadySuccess();
  }

  Stream<AppState> _mapLaunchScreenHiddenToState(
      AppLaunchScreenHidden event) async* {
    yield const AppLoadSuccess();
  }
}
