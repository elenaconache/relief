import 'package:flutter/widgets.dart';

const String SplashPath = '/splash';
const String LoginPath = '/login';

const PageConfiguration SplashPageConfig = PageConfiguration(
    key: 'Splash', path: SplashPath, uiPage: ReliefPage.Splash);
const PageConfiguration LoginPageConfig =
    PageConfiguration(key: 'Login', path: LoginPath, uiPage: ReliefPage.Login);

enum ReliefPage {
  Splash,
  Login,
}

class PageConfiguration {
  final String key;
  final String path;
  final ReliefPage uiPage;

  const PageConfiguration(
      {@required this.key, @required this.path, @required this.uiPage});
}
