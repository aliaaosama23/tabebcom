import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  // Function onItemTapped;
  // MyBottomNavigationBar({this.onItemTapped});
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {


    int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('current selected index is $_selectedIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Packages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Appointments',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0ebcbb),
        onTap: _onItemTapped,
      );
  }
}