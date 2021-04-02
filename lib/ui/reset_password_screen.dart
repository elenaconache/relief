import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:relief/blocs/resetpassword/reset_password_cubit.dart';
import 'package:relief/blocs/resetpassword/reset_password_states.dart';
import 'package:relief/data/translations_helper.dart';
import 'package:relief/dependency_injection.dart';
import 'package:relief/navigation/relief_router_delegate.dart';
import 'package:relief/ui/common/relief_background.dart';
import 'package:relief/ui/common/relief_button.dart';
import 'package:relief/ui/common/relief_logo.dart';
import 'package:relief/ui/common/relief_text_field.dart';
import 'package:relief/ui/common/text_card.dart';
import 'package:relief/values/dimensions.dart';
import 'package:relief/values/styles.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();
  bool _ongoingValidation;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _ongoingValidation = false;
    _emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CubitConsumer<ResetPasswordCubit, ResetPasswordState>(
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
                    padding: EdgeInsets.only(
                        left: smallMargin,
                        right: smallMargin,
                        top: extraLargeMargin,
                        bottom: extraLargeMargin),
                    child: TextCard(
                      titleText: getIt
                          .get<TranslationsHelper>()
                          .getTranslation('reset_password_title'),
                      bodyText: getIt
                          .get<TranslationsHelper>()
                          .getTranslation('reset_password_body'),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: largeMargin),
                              child: ReliefTextField(
                                inputType: TextInputType.emailAddress,
                                validate: () {
                                  return !_ongoingValidation ||
                                      _emailController.text.isNotEmpty;
                                },
                                hintText: getIt
                                    .get<TranslationsHelper>()
                                    .getTranslation('general_email'),
                                isPassword: false,
                                controller: _emailController,
                                errorMessageTag: 'error_empty_field',
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                top: mediumMargin,
                              ),
                              child: ReliefButton(
                                text: getIt
                                    .get<TranslationsHelper>()
                                    .getTranslation('reset_button'),
                                onClick: () {
                                  if (_isValidForm()) {
                                    _onLogin();
                                  }
                                },
                                color: Colors.orangeAccent,
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                top: smallMargin,
                              ),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: RichText(
                                    text: TextSpan(
                                      text: getIt
                                          .get<TranslationsHelper>()
                                          .getTranslation('return_login'),
                                      style: linkTextStyle,
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          _onReturn();
                                        },
                                    ),
                                  ))),
                        ],
                      ),
                    )),
              ],
            ),
          )));
        },
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            Flushbar(
              message: getIt
                  .get<TranslationsHelper>()
                  .getTranslation('reset_success'),
              duration: Duration(seconds: 5),
            )..show(context);
          } else if (state is ResetPasswordError) {
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

  bool _isValidForm() {
    bool valid = _emailController.text.isNotEmpty;

    if (!valid)
      setState(() {
        _ongoingValidation = true;
      });
    return valid;
  }

  _onLogin() {
    final cubit = context.cubit<ResetPasswordCubit>();
    cubit.resetPassword(_emailController.value.text);
  }

  void _onReturn() {
    final delegate = getIt.get<ReliefRouterDelegate>();
    delegate.popRoute();
  }
}
