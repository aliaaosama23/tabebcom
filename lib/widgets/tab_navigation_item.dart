import 'package:flutter/material.dart';
import './../pages/tabs_page/home_page.dart';
import './../pages/tabs_page/offers_page.dart';
import './../pages/tabs_page/oppointments_page.dart';
import './../pages/tabs_page/packages_page.dart';

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
          icon: Icon(Icons.local_offer),
        ),
        TabNavigationItem(
          page: PackagesPage(),
          title: 'Packages',
          icon: Icon(Icons.work_outline),
        ),
        TabNavigationItem(
          page: OppointmentsPage(),
          title: 'Oppointments',
          icon: Icon(Icons.alarm),
        )
      ];
}
