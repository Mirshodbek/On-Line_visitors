import 'package:flutter/material.dart';
import 'package:online_visitors/provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BrainProvider>(
      builder: (context, brain, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('On Line'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: brain.onTabTapped,
            currentIndex: brain.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_city_outlined),
                label: 'Department',
              ),
            ],
          ),
          body: brain.children[brain.currentIndex],
        );
      },
    );
  }
}
