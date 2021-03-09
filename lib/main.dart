import 'package:flutter/material.dart';
import 'package:relief/dependency_injection.dart';
import 'package:relief/navigation/page_config.dart';
import 'package:relief/navigation/relief_route_parser.dart';
import 'package:relief/navigation/relief_router_delegate.dart';

void main() async {
  inject();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final delegate = getIt.get<ReliefRouterDelegate>();
    final parser = ReliefRouteParser();
    delegate.setNewRoutePath(SplashPageConfig);
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }
}
