
import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/pages/menu_pages/offer_details.dart';

class OffersPage extends StatelessWidget {
  OffersPage({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: ElevatedButton(
          onPressed: () {
            // print('button clicked');
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return OfferDetails();
            }));
          },
          child: Text('click me'),
        )),
      ),
    );
  }
}
