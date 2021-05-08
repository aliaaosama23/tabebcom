import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';
import 'package:tabebcom_flutter/pages/tabs_page/packages_page.dart';
import 'package:tabebcom_flutter/utils/theme.dart';
import 'package:tabebcom_flutter/widgets/my_drawer.dart';

import 'home_page.dart';
import 'offers_page.dart';
import 'oppointments_page.dart';

class TabsPage extends StatefulWidget {

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentindex = 0;
  String title = 'Home';

  final GlobalKey<ScaffoldState> _scaffoldLey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
      List<Map<String,dynamic>> tabBarItems = [
    {
      'page': HomePage(),
      'title':getTranslated(context, 'Home').toString(),//'Home',// ,
      'icon': Icon(Icons.home),
    },
    {
      'page': OffersPage(),
      'title': getTranslated(context, 'Offers').toString()  ,
      'icon': Icon(Icons.local_offer_outlined),
    },
    {
      'page': PackagesPage(),
      'title':getTranslated(context, 'Packages').toString()  ,
      'icon': Icon(Icons.school),
    },
    {
      'page': OppointmentsPage(),
      'title': getTranslated(context,'Appointments').toString()  ,
      'icon': Icon(Icons.alarm_on_outlined),
    }
  ];
    return Scaffold(
      key: _scaffoldLey,
      drawer: Container(
        width: 250.0,
        child: MyDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF0ebcbb)),
        elevation: 0.0,
        title: Text(
          getTranslated(context, title).toString(),
          style: TextStyle(color: Color(0xFF0ebcbb)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentindex,
          children: [
            for (final tabItem in tabBarItems) tabItem['page'],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentindex = index;
            if (_currentindex == 0) {
              title = 'Home';
            }
            if (_currentindex == 1) {
              title = 'Offers';
            }
            if (_currentindex == 2) {
              title = 'Packages';
            }
            if (_currentindex == 3) {
              title =  'Appointments';
            }
          });
        },
        elevation: 8.0,
        //fixedColor: myThemeData.primaryColor,
        selectedItemColor: myThemeData.primaryColor,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: _currentindex,
        items: [
          for (final tabItem in tabBarItems)
            BottomNavigationBarItem(
              title:Text(tabItem['title']), //getTranslated(context, tabItem['title']), //getTranslated(context, tabItem['title'].toString()), // tabItem.title, // ,
              icon: tabItem['icon'],
            )
        ],
      ),
    );
  }
}
