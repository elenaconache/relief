import 'package:flutter/widgets.dart';

const String SplashPath = '/splash';
const String LoginPath = '/login';
const String RegisterPath = '/register';

const PageConfiguration SplashPageConfig = PageConfiguration(
    key: 'Splash', path: SplashPath, uiPage: ReliefPage.Splash);
const PageConfiguration LoginPageConfig =
    PageConfiguration(key: 'Login', path: LoginPath, uiPage: ReliefPage.Login);
const PageConfiguration RegisterPageConfig = PageConfiguration(
    key: 'Register', path: RegisterPath, uiPage: ReliefPage.Register);

enum ReliefPage {
  Splash,
  Login,
  Register,
}

class PageConfiguration {
  final String key;
  final String path;
  final ReliefPage uiPage;

  const PageConfiguration(
      {@required this.key, @required this.path, @required this.uiPage});
}
