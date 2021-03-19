import 'package:flutter/material.dart';
import 'package:temp_h/constants.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;

  CustomInput(
      {this.hintText,
      this.focusNode,
      this.textInputAction,
      this.onChanged,
      this.onSubmitted,
      this.isPasswordField});
  @override
  Widget build(BuildContext context) {
    bool _isPasswordFeild = isPasswordField ?? false;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
        obscureText: _isPasswordFeild,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ?? "HintText",
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
