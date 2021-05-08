import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/pages/menu_pages/user_packages.dart';
import './../pages/login_page.dart';
import './../pages/menu_pages/about_page.dart';
import './../pages/menu_pages/complain_page.dart';
import './../pages/menu_pages/privacy_policy_page.dart';
import './../pages/menu_pages/settings.dart';
import './../pages/menu_pages/use_rules_page.dart';
import './../pages/menu_pages/user_family.dart';
import './../pages/menu_pages/user_profile.dart';
import './../pages/menu_pages/user_vaccines.dart';
import '../widgets/menu_item.dart';


class MyDrawer extends StatelessWidget {
  final List<Map<String, Object>> menuList = [
    {'title': "User_Family", 'page': UserFamilyPage(title: "User_Family",)},
    {'title': "User_Package", 'page': UserPckages(title: "User_Package",)},
    {'title':  "User_Vaccines", 'page': UserVaccines(title: "User_Vaccines",)},
    {'title': "Settings", 'page': SettingsPage(title:"Settings")},
    {'title': "Profile", 'page': UserProfile(title:"Profile")},
    {'title':  "About Tabebcom", 'page': AboutPage(title:"About Tabebcom")},
    {'title': "Make a Suggestion / Complaint", 'page': ComplainPage(title:"Make a Suggestion / Complaint")},
    {'title':  "Privacy", 'page': PrivacyPolicyPage(title:"Privacy")},
    {'title':  "Terms Of Use", 'page': UseRulesPage(title:"Terms Of Use")},
    {'title': "Logout", 'page': LoginPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: Container(
           decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/images/bg.png'),fit: BoxFit.cover),
                ),
          child: ListView(
      children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
            child: UserAccountsDrawerHeader( 
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/images/bg.png'),fit: BoxFit.cover),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                accountName: Text('aliaa osama'),
                accountEmail: Text('engaliaaosama@gamil.com')),
          ),
          for (var i = 0; i < menuList.length; i++)
            MenuItem(
                title: menuList[i]['title'], menuItemPage: menuList[i]['page']),
      ],
    ),
        ));
  }
}
