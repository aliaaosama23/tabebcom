import 'package:flutter/material.dart';
import '../../widgets/my_drawer.dart';

class PackagesPage extends StatelessWidget {
  PackagesPage({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Center(   
        child: Text('my Packages'),
      ),
    );
  }
}
