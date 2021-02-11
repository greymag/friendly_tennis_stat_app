import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innim_lib/innim_lib.dart';
import 'package:innim_ui/innim_ui.dart';
import 'package:tennis_stat/application/localization.dart';
import 'package:tennis_stat/blocs/screens/game_day/game_day_bloc.dart';

class GameDayScreen extends StatelessWidget {
  const GameDayScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => GameDayBloc()..shown(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(loc.gameDayTitle),
        ),
        body: BlocBuilder<GameDayBloc, GameDayState>(
          builder: (context, state) {
            if (state is GameDayLoadSuccess) {
              return _buildBody(context);
            }

            debugAssertState(
                state is GameDayInitial || state is GameDayLoadInProgress,
                state);
            return const LoadingWidget();
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return const Center(
      child: Text('GameDayScreen'),
    );
  }
}
