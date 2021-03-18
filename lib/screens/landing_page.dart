import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:temp_h/constants.dart';
import 'package:temp_h/screens/homepage.dart';
import 'package:temp_h/screens/login_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _intialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _intialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, streamSnapshot) {
                  if (streamSnapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("Error: ${streamSnapshot.error}"),
                      ),
                    );
                  }

                  if (streamSnapshot.connectionState ==
                      ConnectionState.active) {
                    User _user = streamSnapshot.data;

                    if (_user == null) {
                      return Loginpage();
                    } else {
                      return Homepage();
                    }
                  }

                  return Scaffold(
                    body: Center(
                      child: Text(
                        "Checking Autentication...",
                        style: Constants.regularHeading,
                      ),
                    ),
                  );
                });
          }

          return Scaffold(
            body: Center(
              child: Text(
                "Intializing app",
                style: Constants.regularHeading,
              ),
            ),
          );
        });
  }
}
