import 'package:flutter/material.dart';
import 'package:innim_ui/innim_ui.dart';

import 'package:tennis_stat/application/localization.dart';
import 'package:tennis_stat/application/routes.dart';
import 'package:tennis_stat/screens/home/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: ColumnWithGap(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          gap: const SizedBox(height: 25),
          children: <Widget>[
            HomeButton(
              label: loc.startDayHomeBtn,
              onPressed: () {
                Navigator.of(context).pushGameDay();
              },
            ),
            HomeButton(
              label: loc.playersHomeBtn,
              onPressed: () {
                Navigator.of(context).pushPlayers();
              },
            ),
          ],
        ),
      ),
    );
  }
}
