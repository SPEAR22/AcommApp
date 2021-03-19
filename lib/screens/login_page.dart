import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:temp_h/constants.dart';
import 'package:temp_h/screens/register_page.dart';
import 'package:temp_h/widget/custom_bttn.dart';
import 'package:temp_h/widget/custom_input.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
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
                child: Text("Welcome User \n Login to your account",
                    textAlign: TextAlign.center, style: Constants.boldHeading),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email..",
                  ),
                  CustomInput(
                    hintText: "Password...",
                  ),
                  CustomBttn(
                    text: "Login",
                    onPressed: () {
                      print("Logged in");
                    },
                    outlineBtn: false,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: CustomBttn(
                  text: "Create New Account",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
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
