import 'package:flutter/material.dart';
import 'package:tennis_stat/application/localization.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.playersTitle),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _onAddPressed(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return const SizedBox.shrink();
  }

  void _onAddPressed(BuildContext context) {}
}
