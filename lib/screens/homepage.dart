import 'package:flutter/material.dart';
import 'package:temp_h/constants.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Homepage",
          style: Constants.regularHeading,
        ),
      ),
    );
  }
}
