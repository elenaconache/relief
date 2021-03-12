import 'package:flutter/material.dart';
import 'package:relief/values/colors.dart';
import 'package:relief/values/styles.dart';

class ReliefTextField extends StatefulWidget {
  final Function validate;
  final TextInputType inputType;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const ReliefTextField(
      {Key key,
      @required this.validate,
      @required this.inputType,
      @required this.hintText,
      @required this.isPassword,
      @required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReliefTextFieldState();
}

class _ReliefTextFieldState extends State<ReliefTextField> {
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        contentPadding:
            EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        fillColor: fillInputColor,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: _isValid ? Colors.amber : errorColor, width: 2),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: _isValid ? fillInputColor : errorColor, width: 2),
            borderRadius: BorderRadius.circular(8)),
        hintStyle: hintTextStyle,
        hintText: widget.hintText,
      ),
      keyboardType: widget.inputType,
      onChanged: (value) {
        setState(() {
          _isValid = widget.validate.call(value);
        });
      },
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      obscureText: widget.isPassword,
      textInputAction: TextInputAction.next,
      style: inputTextStyle,
      controller: widget.controller,
    );
  }
}
