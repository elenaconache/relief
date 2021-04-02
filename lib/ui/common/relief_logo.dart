import 'package:flutter/material.dart';
import 'package:relief/data/translations_helper.dart';
import 'package:relief/dependency_injection.dart';
import 'package:relief/values/dimensions.dart';
import 'package:relief/values/styles.dart';

class ReliefLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: EdgeInsets.only(top: largerMargin),
        child: Image.asset(
          'assets/images/logo_amber.png',
          width: logoSize,
          height: logoSize,
          color: Colors.white,
        ),
      ),
      Text(
        getIt.get<TranslationsHelper>().getTranslation('login_motto'),
        textAlign: TextAlign.center,
        style: mottoTextStyle,
      ),
    ]);
  }
}
