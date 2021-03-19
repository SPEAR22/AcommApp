import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:temp_h/widget/custom_bttn.dart';
import 'package:temp_h/widget/custom_input.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<void> _alertDialogBuilder() async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text("xyz"),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close Dialog")),
            ],
          );
        });
  }

  bool _registerFormLoading = false;
  String _registerEmail = "";
  String _registerPassword = "";
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode = FocusNode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text("Create A New Account",
                    textAlign: TextAlign.center, style: Constants.boldHeading),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email..",
                    onChanged: (value) {
                      _registerEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    isPasswordField: true,
                    hintText: "********",
                    onChanged: (value) {
                      _registerPassword = value;
                    },
                    focusNode: _passwordFocusNode,
                  ),
                  CustomBttn(
                    text: "Create Account",
                    onPressed: () {
                      setState(() {
                        _registerFormLoading = true;
                      });
                    },
                    isLoading: _registerFormLoading,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: CustomBttn(
                  text: "Back to Login",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
