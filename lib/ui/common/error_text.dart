import 'package:flutter/material.dart';
import 'package:relief/values/styles.dart';

class ErrorText extends StatelessWidget {
  final String text;

  const ErrorText({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: errorTextStyle),
    );
  }
}
