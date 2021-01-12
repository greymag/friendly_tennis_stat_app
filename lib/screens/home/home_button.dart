import 'package:flutter/material.dart';
import 'package:innim_ui/innim_ui.dart';

class HomeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const HomeButton({Key key, @required this.label, @required this.onPressed})
      : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainedButton(
      child: Text(label),
      onPressed: onPressed,
    );
  }
}
