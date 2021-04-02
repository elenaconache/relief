import 'package:flutter/material.dart';
import 'package:relief/ui/common/error_text.dart';
import 'package:relief/values/colors.dart';
import 'package:relief/values/dimensions.dart';
import 'package:relief/values/styles.dart';
import 'package:relief/data/translations_helper.dart';
import 'package:relief/dependency_injection.dart';

class ReliefTextField extends StatefulWidget {
  final Function validate;
  final TextInputType inputType;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String errorMessageTag;
  final bool submitted;

  const ReliefTextField(
      {Key key,
      @required this.validate,
      @required this.inputType,
      @required this.hintText,
      @required this.isPassword,
      this.controller,
      this.errorMessageTag = '',
      this.submitted})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReliefTextFieldState();
}

class _ReliefTextFieldState extends State<ReliefTextField> {
  bool _isValid = true;
  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    _isValid = widget.validate.call() || _editing;
    _editing = false;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            contentPadding:
                EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
              borderSide: BorderSide.none,
            ),
            fillColor: fillInputColor,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: _isValid ? yellowBorderColor : errorColor, width: 2),
                borderRadius: BorderRadius.circular(cornerRadius)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: _isValid ? fillInputColor : errorColor, width: 2),
                borderRadius: BorderRadius.circular(cornerRadius)),
            hintStyle: hintTextStyle,
            hintText: widget.hintText,
          ),
          keyboardType: widget.inputType,
          onChanged: (value) {
            setState(() {
              _editing = true;
            });
          },
          enableSuggestions: !widget.isPassword,
          autocorrect: !widget.isPassword,
          obscureText: widget.isPassword,
          textInputAction: TextInputAction.next,
          style: inputTextStyle,
          controller: widget.controller,
        ),
        _isValid
            ? Container()
            : ErrorText(
                text: getIt
                    .get<TranslationsHelper>()
                    .getTranslation(widget.errorMessageTag))
      ],
    );
  }
}
