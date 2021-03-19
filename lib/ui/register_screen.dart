import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:relief/blocs/register/register_cubit.dart';
import 'package:relief/blocs/register/register_states.dart';
import 'package:relief/data/translations_helper.dart';
import 'package:relief/dependency_injection.dart';
import 'package:relief/ui/common/relief_background.dart';
import 'package:relief/ui/common/relief_button.dart';
import 'package:relief/ui/common/relief_logo.dart';
import 'package:relief/ui/common/relief_text_field.dart';
import 'package:relief/values/styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _acceptedTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CubitConsumer<RegisterCubit, RegisterState>(
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
                      inputType: TextInputType.text,
                      validate: (String value) {
                        return value.length > 2;
                      },
                      hintText: getIt
                          .get<TranslationsHelper>()
                          .getTranslation('general_username'),
                      isPassword: false,
                      controller: _usernameController,
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                    child: ReliefTextField(
                      inputType: TextInputType.emailAddress,
                      validate: (String value) {
                        return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
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
                  padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: ReliefTextField(
                    inputType: TextInputType.visiblePassword,
                    validate: (String value) {
                      return value.isNotEmpty && value.length >= 10;
                    },
                    hintText: getIt
                        .get<TranslationsHelper>()
                        .getTranslation('general_confirm_password'),
                    isPassword: true,
                    controller: _confirmPasswordController,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _acceptedTerms,
                          onChanged: (value) {
                            _onTermsCheck(value);
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            text: getIt
                                .get<TranslationsHelper>()
                                .getTranslation('message_agree_terms'),
                            style: linkTextStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _onTerms();
                              },
                          ),
                        )
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 16, left: 20, right: 20),
                    child: ReliefButton(
                        iconPath: '',
                        text: getIt
                            .get<TranslationsHelper>()
                            .getTranslation('general_register'),
                        onClick: () => {_onRegister()},
                        color: Colors.orangeAccent,
                        iconColor: Colors.white)),
                Spacer(),
              ],
            ),
          )));
        },
        listener: (context, state) {
          /*  if (state is LoginSuccess) {
            print('success, user is ${state.user}');
          }*/
        },
      ),
    );
  }

  void _onRegister() {
    print('register');
  }

  void _onTerms() {
    print('terms');
  }

  void _onTermsCheck(bool value) {
    print('accepted');
    setState(() {
      _acceptedTerms = value;
    });
  }
}
