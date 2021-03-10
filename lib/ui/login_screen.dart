import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relief/blocs/login/login_cubit.dart';
import 'package:relief/blocs/login/login_states.dart';
import 'package:relief/data/translations_helper.dart';
import 'package:relief/dependency_injection.dart';
import 'package:relief/ui/common/relief_button.dart';
import 'package:relief/ui/common/relief_text_field.dart';
import 'package:relief/values/colors.dart';
import 'package:relief/values/styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CubitConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                  child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        'assets/images/header.svg',
                        color: Colors.amber,
                        height: 100,
                      ),
                    ),
                    Image.asset(
                      'assets/images/logo_amber.png',
                      width: 120,
                      height: 120,
                    ),
                    Text(
                      getIt
                          .get<TranslationsHelper>()
                          .getTranslation('login_motto'),
                      textAlign: TextAlign.center,
                      style: mottoTextStyle,
                    ),
                    Spacer(),
                    Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: ReliefButton(
                            iconPath: 'assets/images/fb.svg',
                            text: getIt
                                .get<TranslationsHelper>()
                                .getTranslation('login_facebook'),
                            onClick: () => {_onFacebookLogin()},
                            color: blueFacebookColor,
                            iconColor: Colors.white)),
                    Padding(
                        padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                        child: ReliefButton(
                            iconPath: 'assets/images/google.svg',
                            text: getIt
                                .get<TranslationsHelper>()
                                .getTranslation('login_google'),
                            onClick: () => {_onGoogleLogin()},
                            color: redGoogleColor,
                            iconColor: Colors.white)),
                    Spacer(),
                    Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 24),
                        child: ReliefTextField(
                          inputType: TextInputType.emailAddress,
                          validate: (String value) {
                            return value
                                .isNotEmpty; //RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                          },
                          hintText: getIt
                              .get<TranslationsHelper>()
                              .getTranslation('general_email'),
                          isPassword: false,
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
                            isPassword: true)),
                    Spacer(),
                    Padding(
                        padding: EdgeInsets.only(top: 12, left: 20, right: 20),
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
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: RichText(
                                  text: TextSpan(
                                    text: getIt
                                        .get<TranslationsHelper>()
                                        .getTranslation(
                                            'general_forgot_password'),
                                    style: linkTextStyle,
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        _onForgotPassword();
                                      },
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: ReliefButton(
                                    iconPath: '',
                                    text: getIt
                                        .get<TranslationsHelper>()
                                        .getTranslation('general_register'),
                                    onClick: () => {_onRegister()},
                                    color: Colors.orangeAccent,
                                    iconColor: Colors.white))
                          ],
                        )),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(
                        'assets/images/footer.svg',
                        color: Colors.amber,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              )));
        },
        listener: (context, state) {},
      ),
    );
  }

  _onFacebookLogin() {
    print('facebook login');
  }

  _onGoogleLogin() {
    print('google login');
  }

  _onLogin() {
    print('email login');
  }

  _onRegister() {
    print('register');
  }

  void _onForgotPassword() {
    print('forgot password');
  }
}
