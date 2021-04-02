import 'package:flutter/material.dart';
import 'package:relief/values/dimensions.dart';
import 'package:relief/values/styles.dart';

class TextCard extends StatelessWidget {
  final String titleText;
  final String bodyText;
  final Widget child;

  const TextCard({
    Key key,
    this.titleText,
    this.bodyText,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        child: Padding(
            padding: EdgeInsets.only(
                left: mediumMargin,
                right: mediumMargin,
                top: largeMargin,
                bottom: largeMargin),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  titleText,
                  style: cardTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: smallMargin),
                ),
                Text(
                  bodyText,
                  style: cardBodyTextStyle,
                  textAlign: TextAlign.center,
                ),
                child
              ],
            )));
  }
}
