import 'package:flutter/material.dart';
import 'package:innim_ui/innim_ui.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(),
    );
  }
}
