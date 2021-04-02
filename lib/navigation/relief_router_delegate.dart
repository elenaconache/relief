import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:relief/blocs/login/login_cubit.dart';
import 'package:relief/blocs/register/register_cubit.dart';
import 'package:relief/blocs/resetpassword/reset_password_cubit.dart';
import 'package:relief/blocs/splash/splash_cubit.dart';
import 'package:relief/dependency_injection.dart';
import 'package:relief/navigation/page_config.dart';
import 'package:relief/ui/login_screen.dart';
import 'package:relief/ui/register_screen.dart';
import 'package:relief/ui/reset_password_screen.dart';
import 'package:relief/ui/splash_screen.dart';

class ReliefRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<Page> _pages = [];

  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
    );
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration pageData) {
    _pages.clear();
    addPage(pageData);
    return Future.value(null);
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _pages.remove(route.settings);
    notifyListeners();

    return true;
  }

  void _removePage(MaterialPage page) {
    if (page != null) {
      _pages.remove(page);
    }
    notifyListeners();
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
      child: child,
      key: Key(pageConfig.key),
      name: pageConfig.path,
      arguments: pageConfig,
    );
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;

    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case ReliefPage.Splash:
          _addPageData(
              CubitProvider<SplashCubit>(
                create: (context) => getIt.get<SplashCubit>(),
                child: SplashScreen(),
              ),
              SplashPageConfig);
          break;
        case ReliefPage.Login:
          _addPageData(
              CubitProvider<LoginCubit>(
                create: (context) => getIt.get<LoginCubit>(),
                child: LoginScreen(),
              ),
              LoginPageConfig);
          break;
        case ReliefPage.Register:
          _addPageData(
              CubitProvider<RegisterCubit>(
                create: (context) => getIt.get<RegisterCubit>(),
                child: RegisterScreen(),
              ),
              RegisterPageConfig);
          break;
        case ReliefPage.ResetPassword:
          _addPageData(
              CubitProvider<ResetPasswordCubit>(
                create: (context) => getIt.get<ResetPasswordCubit>(),
                child: ResetPasswordScreen(),
              ),
              ResetPasswordPageConfig);
          break;
        default:
          break;
      }
      notifyListeners();
    }
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
    notifyListeners();
  }

  void replaceAll(PageConfiguration newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
    notifyListeners();
  }
}
