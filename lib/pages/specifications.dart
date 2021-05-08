
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tabebcom_flutter/services/get_specializations.dart';
import './../models/clinc.dart';
import '../pages/specifications_doctors.dart';
import '../utils/theme.dart';
import 'package:http/http.dart' as http;

class Specifications extends StatelessWidget {
  final String title;
  final bool isTeleMed;
  Specifications({this.title, this.isTeleMed});

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    print('locale is $myLocale');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        iconTheme: IconThemeData(color: myThemeData.iconTheme.color),
        textTheme: TextTheme(headline6: myThemeData.primaryTextTheme.headline6),
      ),
      body: FutureBuilder<List<Clinc>>(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? Clincs(clincs: snapshot.data, locale: myLocale.toString())
              : Center(
                  child: CircularProgressIndicator(
                  semanticsLabel: 'please wait ..',
                ));
        },
        future: getClincs(http.Client()),
      ),
    );
  }
}

class Clincs extends StatelessWidget {
  final List<Clinc> clincs;
  final String locale;
  Clincs({Key key, this.clincs, this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clincs.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding:
              EdgeInsets.only(right: 16.0, left: 16.0, top: 2.0, bottom: 2.0),
          child: ListTile(
            leading: 
            // Icon(
            //   Icons.medical_services, //business_center_sharp,
            //   color: myThemeData.primaryColor,
            //   size: 20.0,
            // ),
             Icon(
                FontAwesome.stethoscope,
                color: myThemeData.primaryColor,
                 size: 20.0,
              ),
            title: Text(
              locale == "ar_SA"
                  ? '${clincs[index].codeDescriptionAr}'
                  : '${clincs[index].codeDescriptionEn}',
              style: TextStyle(fontSize: 16.0,fontFamily: myThemeData.textTheme.bodyText1.fontFamily),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SpecificationDoctors(
                  title: locale == "ar_SA"
                      ? clincs[index].codeDescriptionAr
                      : clincs[index].codeDescriptionEn,
                  doctorSpeciality: clincs[index].codeUnique,
                );
              }));
            },
          ),
          // Divider(),
        );
      },
    );
  }
}

