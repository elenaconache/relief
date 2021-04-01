import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:relief/blocs/splash/splash_cubit.dart';
import 'package:relief/blocs/splash/splash_states.dart';
import 'package:relief/dependency_injection.dart';
import 'package:relief/navigation/page_config.dart';
import 'package:relief/navigation/relief_router_delegate.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Future<void> _getTranslationsRequest() async {
    final cubit = context.cubit<SplashCubit>();
    cubit.getTranslations();
  }

  @override
  void initState() {
    super.initState();
    print('init state');
    _getTranslationsRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CubitConsumer<SplashCubit, SplashState>(
        builder: (context, state) {
          return AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(milliseconds: 1000),
            child: Center(
                child: Padding(
              padding: EdgeInsets.all(24),
              child: Image.asset('assets/images/splash_yoga.png'),
            )),
          );
        },
        listener: (context, state) {
          if (state is TranslationsSuccess) {
            final delegate = getIt.get<ReliefRouterDelegate>();
            delegate.replace(LoginPageConfig);
          } else if (state is TranslationsError) {
            final delegate = ReliefRouterDelegate();
            delegate.replace(LoginPageConfig);
          }
        },
      ),
    );
  }
}
