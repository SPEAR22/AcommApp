import 'package:flutter/material.dart';
import 'package:temp_h/widget/custom_action_bar.dart';

class SavedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("Home Tab"),
          ),
          CustomActionBar(
            hasBackArrow: false,
            title: "Saved Products",
            hasTitle: true,
          ),
        ],
      ),
    );
  }
}
