import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innim_lib/innim_lib.dart';
import 'package:innim_ui/innim_ui.dart';
import 'package:tennis_stat/application/localization.dart';
import 'package:tennis_stat/blocs/screens/players/players_bloc.dart';
import 'package:tennis_stat/models/models.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => PlayersBloc(context.read())..shown(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(loc.playersTitle),
        ),
        body: BlocBuilder<PlayersBloc, PlayersState>(
          builder: (context, state) {
            if (state is PlayersLoadSuccess) {
              return _buildBody(
                context,
                players: state.players,
              );
            }

            debugAssertState(
                state is PlayersInitial || state is PlayersLoadInProgress,
                state);
            return const LoadingWidget();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _onAddPressed(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, {@required List<Player> players}) {
    return ListView.separated(
      itemBuilder: (context, i) => _buildPlayerItem(context, players[i]),
      separatorBuilder: (context, i) => const Divider(),
      itemCount: players.length,
    );
  }

  Widget _buildPlayerItem(BuildContext context, Player player) {
    return ListTile(
      title: Text(player.fullName),
    );
  }

  void _onAddPressed(BuildContext context) {}
}
