import 'package:temp_h/widget/bottom_tabs.dart';
import 'package:flutter/material.dart';
import 'package:temp_h/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:temp_h/widget/bottom_tabs.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
PageController _tabsPageController;
int _selectedTab = 0;

  @override
    void initState() {
      _tabsPageController = PageController();
      super.initState();
    }

    @override
      void dispose() {
        _tabsPageController.dispose();
        super.dispose();
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(
          child: PageView(
            controller: _tabsPageController,
            onPageChanged: (num){
              setState(() {
                _selectedTab = num;
              });
            },
            children: [
              Container(
                child: Center(
                  child: Text("Homepage"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("Searchpage"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("Savedpage"),
                ),
              )
            ],)
        ),
        BottomTabs(
          selectedTab: _selectedTab,
          tabPressed: (num){
             _tabsPageController.animateToPage(
                num, 
                duration: Duration(milliseconds: 300), 
                curve: Curves.easeOutCubic);
          },
        ),
      ],)
    );
  }
}
