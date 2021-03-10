import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relief/values/styles.dart';

class ReliefButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onClick;
  final Color color;
  final Color iconColor;

  const ReliefButton(
      {Key key,
      @required this.iconPath,
      @required this.text,
      @required this.onClick,
      @required this.color,
      @required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return iconPath.isNotEmpty
        ? ElevatedButton.icon(
            icon: Expanded(
              flex: 1,
              child: SvgPicture.asset(
                iconPath,
                height: 24,
                width: 24,
                color: iconColor,
              ),
            ),
            label: Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 12, bottom: 12),
                child: Text(
                  text,
                  style: buttonTextStyle,
                ),
              ),
            ),
            onPressed: onClick,
            style: _getElevatedButtonStyle(),
          )
        : ElevatedButton(
            child: Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                text,
                style: buttonTextStyle,
              ),
            ),
            onPressed: onClick,
            style: _getElevatedButtonStyle(),
          );
  }

  ButtonStyle _getElevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      primary: color,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(8.0),
      ),
    );
  }
}
