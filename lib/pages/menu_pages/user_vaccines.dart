import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';
import 'package:tabebcom_flutter/models/vaccine.dart';
import 'package:http/http.dart' as http;
import 'package:tabebcom_flutter/services/get_user_vaccines.dart';
import 'package:tabebcom_flutter/utils/theme.dart';

class UserVaccines extends StatelessWidget {
  final String title;

  UserVaccines({this.title});

  @override
  Widget build(BuildContext context) {
      Locale myLocale = Localizations.localeOf(context);
    print('locale is $myLocale');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(getTranslated(context, title)),
          iconTheme: IconThemeData(color: myThemeData.iconTheme.color),
          textTheme:
              TextTheme(headline6: myThemeData.primaryTextTheme.headline6),
        ),
        body: FutureBuilder<List<Vaccine>>(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? UserVaccinesList(vaccines: snapshot.data,locale:myLocale.toString())
                : Center(child: CircularProgressIndicator());
          },
          future: getPatientVaccination(http.Client(), 1354079),
        ));
  }
}

class UserVaccinesList extends StatelessWidget {
  final List<Vaccine> vaccines;
  final String locale;
  UserVaccinesList({this.vaccines,this.locale});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 16.0,
        left: 16.0,
      ),
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: Color(0xFFf2f2f2),
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                          child: locale=='ar_SA'?Text(vaccines[index].vaccNameAr) :Text(vaccines[index].vaccNameEn), flex: 12),
                      Expanded(
                          child: Container(
                            // color: myThemeData.iconTheme.color,
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: vaccines[index].isDone ? myThemeData.iconTheme.color : null,
                              //borderRadius: BorderRadius.circular(15.0),
                              shape: BoxShape.circle,
                              border: Border.all(color: myThemeData.iconTheme.color)
                            ),
                          ),
                          flex: 3)
                    ],
                  ),
                ));
          },
          itemCount: vaccines.length),
    );
  }
}

