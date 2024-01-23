
import 'package:elaziz/src/screen/detail.dart';
import 'package:elaziz/src/screen/district.dart';
import 'package:elaziz/src/screen/home.dart';

import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() =>
      _RootState();
}

class _RootState extends State {
  int _selectedTab = 0;

  List _pages = [
      Home(),
      District(),
 
 
  ];





  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });

  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Keşfet"),
           BottomNavigationBarItem(
              icon: Icon(Icons.place), label: "İlçeler"),
         
         
        
        ],
      ),
    );
  }
}