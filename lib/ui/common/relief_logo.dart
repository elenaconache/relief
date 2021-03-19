import 'package:flutter/material.dart';
import 'package:relief/data/translations_helper.dart';
import 'package:relief/dependency_injection.dart';
import 'package:relief/values/styles.dart';

class ReliefLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: EdgeInsets.only(top: 48),
        child: Image.asset(
          'assets/images/logo_amber.png',
          width: 120,
          height: 120,
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
