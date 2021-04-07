import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temp_h/constants.dart';
import 'package:temp_h/screens/product_page.dart';
import 'package:temp_h/widget/custom_action_bar.dart';
import 'package:temp_h/widget/product_card.dart';

class HomeTab extends StatelessWidget {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Products");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _productsRef.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  padding: EdgeInsets.only(
                    top: 108.0,
                    bottom: 24.0,
                  ),
                  children: snapshot.data.docs.map((document) {
                    return ProductCard(
                      title: document.data()['name'],
                      imageUrl: document.data()['images'][0],
                      price: "₹${document.data()['price']}",
                      productId: document.id,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(
                                      productId: document.id,
                                    )));
                      },
                    );
                  }).toList(),
                );
              }

              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          CustomActionBar(
            hasBackArrow: false,
            title: "Home",
            hasTitle: true,
          ),
        ],
      ),
    );
  }
}
