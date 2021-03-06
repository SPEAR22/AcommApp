import 'package:flutter/material.dart';
import 'package:temp_h/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temp_h/screens/cart_page.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;

  final CollectionReference _userRef =
        FirebaseFirestore.instance.collection("Users");

  final User _user = FirebaseAuth.instance.currentUser;

  CustomActionBar(
      {this.hasTitle, this.hasBackArrow, this.title, this.hasBackground});
  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;
    bool _hasBackground = hasBackground ?? true;

    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackground
              ? LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment(0, 0),
                  end: Alignment(0, 1),
                )
              : null),
      padding: EdgeInsets.only(
        top: 40.0,
        left: 24.0,
        right: 24.0,
        bottom: 40.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Image(
                  height: 18.0,
                  width: 18.0,
                  image: AssetImage("assets/images/rightarrow.png"),
                ),
              ),
            ),
          if (_hasTitle)
            Text(
              title ?? "ActionBar",
              style: Constants.boldHeading,
            ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => CartPage(),));
            },
            child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: StreamBuilder(
                  stream: _userRef.doc(_user.uid).collection("Cart").snapshots(),
                  builder: (context, snapshot) {
                    int _totalItems = 0;
                    if(snapshot.connectionState == ConnectionState.active){
                      List _document = snapshot.data.docs;
                      _totalItems = _document.length;
                    }
                    return Text(
                      "$_totalItems" ?? "0",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
