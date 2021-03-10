import 'package:flutter/material.dart';
import 'package:relief/values/colors.dart';
import 'package:relief/values/styles.dart';

class ReliefTextField extends StatefulWidget {
  final Function validate;
  final TextInputType inputType;
  final String hintText;
  final bool isPassword;

  const ReliefTextField(
      {Key key,
      @required this.validate,
      @required this.inputType,
      @required this.hintText,
      @required this.isPassword})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ReliefTextFieldState();
}

class ReliefTextFieldState extends State<ReliefTextField> {
  bool isValid = true;

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
                color: isValid ? Colors.amber : errorColor, width: 2),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isValid ? fillInputColor : errorColor, width: 2),
            borderRadius: BorderRadius.circular(8)),
        hintStyle: hintTextStyle,
        hintText: widget.hintText,
      ),
      keyboardType: widget.inputType,
      onChanged: (value) {
        setState(() {
          isValid = widget.validate.call(value);
        });
      },
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      obscureText: widget.isPassword,
      textInputAction: TextInputAction.next,
      style: inputTextStyle,
    );
  }
}
