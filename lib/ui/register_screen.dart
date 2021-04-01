import 'package:flushbar/flushbar.dart';
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

  bool _acceptedTerms;
  bool _ongoingValidation;

  @override
  void initState() {
    super.initState();
    _acceptedTerms = false;
    _ongoingValidation = false;
  }

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
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ReliefLogo(),
                    Padding(
                        padding: EdgeInsets.only(top: 64),
                        child: ReliefTextField(
                          inputType: TextInputType.text,
                          validate: () {
                            return !_ongoingValidation ||
                                _isValidName(_usernameController.text);
                          },
                          hintText: getIt
                              .get<TranslationsHelper>()
                              .getTranslation('general_username'),
                          isPassword: false,
                          controller: _usernameController,
                          errorMessageTag: 'error_name',
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: ReliefTextField(
                          inputType: TextInputType.emailAddress,
                          validate: () {
                            return !_ongoingValidation ||
                                _isValidEmail(_emailController.text);
                          },
                          hintText: getIt
                              .get<TranslationsHelper>()
                              .getTranslation('general_email'),
                          isPassword: false,
                          controller: _emailController,
                          errorMessageTag: 'error_email',
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: ReliefTextField(
                        inputType: TextInputType.visiblePassword,
                        validate: () {
                          return !_ongoingValidation || _isValidPassword();
                        },
                        hintText: getIt
                            .get<TranslationsHelper>()
                            .getTranslation('general_password'),
                        isPassword: true,
                        controller: _passwordController,
                        errorMessageTag: 'error_password',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: ReliefTextField(
                        inputType: TextInputType.visiblePassword,
                        validate: () {
                          return !_ongoingValidation ||
                              _isValidConfirmPassword(
                                  _confirmPasswordController.text);
                        },
                        hintText: getIt
                            .get<TranslationsHelper>()
                            .getTranslation('general_confirm_password'),
                        isPassword: true,
                        controller: _confirmPasswordController,
                        errorMessageTag: 'error_confirm_password',
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          top: 8,
                        ),
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
                        padding: EdgeInsets.only(
                          top: 16,
                        ),
                        child: ReliefButton(
                            iconPath: '',
                            text: getIt
                                .get<TranslationsHelper>()
                                .getTranslation('general_register'),
                            onClick: _onRegister,
                            color: Colors.orangeAccent,
                            iconColor: Colors.white)),
                    Spacer(),
                  ],
                )),
          )));
        },
        listener: (context, state) {
          if (state is RegisterSuccess) {
            print('register success: ${state.response}');
          } else if (state is RegisterError) {
            print('register error: ${state.errorMessageTag}');
            Flushbar(
              message: getIt
                  .get<TranslationsHelper>()
                  .getTranslation(state.errorMessageTag),
              duration: Duration(seconds: 2),
            )..show(context);
          }
        },
      ),
    );
  }

  void _onRegister() {
    if (_isValidRegisterForm()) {
      if (!_acceptedTerms) {
        Flushbar(
          message: getIt
              .get<TranslationsHelper>()
              .getTranslation('error_accept_terms'),
          duration: Duration(seconds: 2),
        )..show(context);
      } else {
        final cubit = context.cubit<RegisterCubit>();
        cubit.register(_emailController.value.text,
            _passwordController.value.text, _usernameController.value.text);
      }
    } else {
      setState(() {
        _ongoingValidation = true;
      });
    }
  }

  void _onTerms() {
    print('terms');
  }

  void _onTermsCheck(bool value) {
    setState(() {
      _acceptedTerms = value;
    });
  }

  bool _isValidRegisterForm() {
    bool valid = _isValidName(_usernameController.text) &&
        _isValidConfirmPassword(_confirmPasswordController.text) &&
        _isValidPassword() &&
        _isValidEmail(_emailController.text) &&
        !_acceptedTerms;
    if (!valid) {
      setState(() {
        _ongoingValidation = true;
      });
    }
    return valid;
  }

  bool _isValidEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  bool _isValidPassword() {
    return _passwordController.text.isNotEmpty &&
        _passwordController.text.length >= 7;
  }

  bool _isValidName(String value) {
    return value.isNotEmpty && value.length >= 5;
  }

  bool _isValidConfirmPassword(String value) {
    return value.isNotEmpty && value == _passwordController.text;
  }
}
