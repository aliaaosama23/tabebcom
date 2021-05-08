import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/pages/tabs_page/home_page.dart';
import 'package:tabebcom_flutter/pages/tabs_page/offers_page.dart';
import 'package:tabebcom_flutter/pages/tabs_page/packages_page.dart';

import 'oppointments_page.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem(
      {@required this.page, @required this.title, @required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomePage(),
          title: 'Home',
          icon: Icon(Icons.home),
        ),
        TabNavigationItem(
          page: OffersPage(),
          title: 'Offers',
          icon: Icon(Icons.local_offer_outlined),
        ),
        TabNavigationItem(
          page: PackagesPage(),
          title: 'Packages',
          icon: Icon(Icons.school),
        ),
        TabNavigationItem(
          page: OppointmentsPage(),
          title: 'Appointmants',
          icon: Icon(Icons.alarm_on_outlined),
        )
      ];
}
