import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';
import '../utils/theme.dart';

class MenuItem extends StatelessWidget {
  
  final String title;
  final Widget menuItemPage;

  MenuItem({this.title, this.menuItemPage});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        child: ListTile(
          title: Text(
             getTranslated(context, title),
            style: TextStyle(
                color: myThemeData.accentColor,
                fontSize: 15.0,
                fontFamily: 'HelveticaNeueW23-Reg',
                ),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => menuItemPage),
            );
            //Navigator.of(context).pushNamed(UserFamilyPage.routeName)
          },
        ));
  }
}
