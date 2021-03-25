import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temp_h/widget/custom_action_bar.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  ProductPage({this.productId});
  @override
  _ProductNameState createState() => _ProductNameState();
}

class _ProductNameState extends State<ProductPage> {
  final CollectionReference _productsRef = FirebaseFirestore.instance.collection("Products");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _productsRef.doc(widget.productId).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> documentData = snapshot.data.data();
            return ListView(
              children: [
                Image.network(
                  "${documentData['images'][0]}"
                ),
                Text("Product Name"),
                Text("Price"),
                Text("Description"),
                Text("Select Size"),
              ],
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
            hasBackArrow: true,
            hasTitle: false,
        
          )
        ],
      ),
    );
  }
}