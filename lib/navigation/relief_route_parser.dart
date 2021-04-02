import 'package:flutter/material.dart';
import 'package:relief/navigation/page_config.dart';

class ReliefRouteParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.isEmpty) {
      return SplashPageConfig;
    }
    final path = uri.pathSegments[0];
    switch (path) {
      case SplashPath:
        return SplashPageConfig;
      case LoginPath:
        return LoginPageConfig;
      case RegisterPath:
        return RegisterPageConfig;
      case ResetPasswordPath:
        return ResetPasswordPageConfig;
      default:
        return SplashPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case ReliefPage.Splash:
        return const RouteInformation(location: SplashPath);
      case ReliefPage.Login:
        return const RouteInformation(location: LoginPath);
      case ReliefPage.ResetPassword:
        return const RouteInformation(location: ResetPasswordPath);
      default:
        return const RouteInformation(location: SplashPath);
    }
  }
}
