import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameDayScreen extends StatelessWidget {
  const GameDayScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('GameDayScreen'),
      ),
    );
  }
}
