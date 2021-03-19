import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:relief/blocs/login/login_cubit.dart';
import 'package:relief/blocs/login/login_states.dart';
import 'package:relief/data/translations_helper.dart';
import 'package:relief/dependency_injection.dart';
import 'package:relief/navigation/page_config.dart';
import 'package:relief/navigation/relief_router_delegate.dart';
import 'package:relief/ui/common/relief_background.dart';
import 'package:relief/ui/common/relief_button.dart';
import 'package:relief/ui/common/relief_fab.dart';
import 'package:relief/ui/common/relief_logo.dart';
import 'package:relief/ui/common/relief_text_field.dart';
import 'package:relief/values/colors.dart';
import 'package:relief/values/styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CubitConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: ReliefBackground(
                  child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReliefLogo(),
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 64),
                    child: ReliefTextField(
                      inputType: TextInputType.emailAddress,
                      validate: (String value) {
                        return value.isNotEmpty;
                      },
                      hintText: getIt
                          .get<TranslationsHelper>()
                          .getTranslation('general_email'),
                      isPassword: false,
                      controller: _emailController,
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: ReliefTextField(
                    inputType: TextInputType.visiblePassword,
                    validate: (String value) {
                      return value.isNotEmpty;
                    },
                    hintText: getIt
                        .get<TranslationsHelper>()
                        .getTranslation('general_password'),
                    isPassword: true,
                    controller: _passwordController,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16, left: 20, right: 20),
                    child: ReliefButton(
                        iconPath: '',
                        text: getIt
                            .get<TranslationsHelper>()
                            .getTranslation('general_login'),
                        onClick: () => {_onLogin()},
                        color: Colors.orangeAccent,
                        iconColor: Colors.white)),
                Padding(
                    padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            text: getIt
                                .get<TranslationsHelper>()
                                .getTranslation('general_forgot_password'),
                            style: linkTextStyle,
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                _onForgotPassword();
                              },
                          ),
                        ))),
                Spacer(),
                Padding(
                    padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ReliefButton(
                                  iconPath: '',
                                  text: getIt
                                      .get<TranslationsHelper>()
                                      .getTranslation('general_register'),
                                  onClick: () => {_onRegister()},
                                  color: Colors.orangeAccent,
                                  iconColor: Colors.white)),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: ReliefFab(
                              icon: FaIcon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.white,
                              ),
                              onClick: () => {_onFacebookLogin()},
                              color: blueFacebookColor,
                            ),
                          ),
                          ReliefFab(
                            icon: FaIcon(
                              FontAwesomeIcons.googlePlusG,
                              color: Colors.white,
                            ),
                            onClick: () => {_onGoogleLogin()},
                            color: redGoogleColor,
                          ),
                        ])),
                Spacer(),
              ],
            ),
          )));
        },
        listener: (context, state) {
          if (state is LoginSuccess) {
            print('success, user is ${state.user}');
          }
        },
      ),
    );
  }

  _onFacebookLogin() {
    final cubit = context.cubit<LoginCubit>();
    cubit.signInWithFacebook();
    print('facebook login');
  }

  _onGoogleLogin() {
    final cubit = context.cubit<LoginCubit>();
    cubit.signInWithGoogle();
    print('google login');
  }

  _onLogin() {
    final cubit = context.cubit<LoginCubit>();
    cubit.signInWithEmail(
        _emailController.value.text, _passwordController.value.text);
    print('email login');
  }

  _onRegister() {
    print('register');
    final delegate = getIt.get<ReliefRouterDelegate>();
    delegate.addPage(RegisterPageConfig);
  }

  void _onForgotPassword() {
    print('forgot password');
  }
}
