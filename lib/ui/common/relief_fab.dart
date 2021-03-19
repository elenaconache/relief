import 'package:flutter/material.dart';

class ReliefFab extends StatelessWidget {
  final Widget icon;
  final VoidCallback onClick;
  final Color color;

  const ReliefFab({
    Key key,
    @required this.icon,
    @required this.onClick,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: icon,
      onPressed: onClick,
      backgroundColor: color,
    );
  }
}
