import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';
import 'package:tabebcom_flutter/services/get_specialilzations_doctors.dart';
import '../models/doctor.dart';
import '../utils/theme.dart';
import 'doctor_appointments.dart';
import 'doctor_details.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SpecificationDoctors extends StatefulWidget {
  final String doctorSpeciality;
  final String title;
  SpecificationDoctors({this.title, this.doctorSpeciality});

  @override
  _SpecificationDoctorsState createState() => _SpecificationDoctorsState();
}

class _SpecificationDoctorsState extends State<SpecificationDoctors> {
  Position currentPosition;
  double lat;
  double long;

  @override
  void initState() {
    super.initState();

    locateUser();
  }

  Future locateUser() async {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        currentPosition = position;
        lat = currentPosition.latitude;
        long = currentPosition.longitude;
        print('lat is $lat long is $long');
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
     Locale myLocale = Localizations.localeOf(context);
    print('locale is $myLocale');
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
          iconTheme: IconThemeData(color: myThemeData.iconTheme.color),
          textTheme:
              TextTheme(headline6: myThemeData.primaryTextTheme.headline6),
        ),
        body: FutureBuilder<List<Doctor>>(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print('snapnshot error ${snapshot.error}');
            return snapshot.hasData
                ? Doctors(doctorsList: snapshot.data,locale:myLocale.toString())
                : Center(child: CircularProgressIndicator());
          },
          future: getDoctorsBySpeciality(http.Client(),widget.doctorSpeciality, lat, long),
        ));
  }
}

// widget.doctorSpeciality, lat, long}
class Doctors extends StatelessWidget {
  final List<Doctor> doctorsList;
  final String locale;
  Doctors({this.doctorsList,this.locale});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctorsList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5.0,
            child: Container(
              padding: EdgeInsets.all(6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                          child: ClipOval(
                              child: Image.asset("assets/images/avatar.png")),
                          flex: 3),
                      Expanded(
                          child: Column(
                            children: [
                              DoctorInfo(
                                icon: Icons.person_outline,
                                doctorData:  locale == "ar_SA" ? doctorsList[index].doctorNameAr : doctorsList[index].doctorNameEn,
                              ),
                              DoctorInfo(
                                icon: FontAwesome.stethoscope,
                                doctorData: locale == "ar_SA" ? doctorsList[index].specializationAr : doctorsList[index].specializationEn,
                              ),
                              DoctorInfo(
                                icon: Icons.place_outlined,
                                doctorData: doctorsList[index].officialAddress,
                              ),
                              DoctorInfo(
                                icon: Icons.phone_in_talk_outlined,
                                doctorData: doctorsList[index].mobileNumber,
                              ),
                              SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                          flex: 7)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 6,
                          child: ElevatedButton(
                            child: Text(
                             getTranslated(context, "more") ,
                              style: TextStyle(color: myThemeData.primaryColor),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFFe0e0e0)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)))),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return DoctorDetails(
                                  title:  locale == "ar_SA" ? doctorsList[index].doctorNameAr :doctorsList[index].doctorNameEn,
                                  doctor: doctorsList[index],
                                  locale: "ar_SA"
                                );
                              }));
                            },
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 12,
                        child: ElevatedButton(
                          child: Text(
                            getTranslated(context,"book"),
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  myThemeData.primaryColor),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6.0)))),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DoctorAppointments(
                                title: locale == "ar_SA" ? doctorsList[index].doctorNameAr : doctorsList[index].doctorNameEn,
                                doctorCode: doctorsList[index].doctorCode,
                                fkBranchID: doctorsList[index].fkBranchId,
                                iSTeleMed: doctorsList[index].isTeleMed,
                              );
                            }));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DoctorInfo extends StatelessWidget {
  final String doctorData;
  final IconData icon;
  DoctorInfo({this.icon, this.doctorData});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30.0,
        child: Row(
          children: [
            Expanded(
                child: Icon(
                  icon,
                  color: myThemeData.primaryColor,
                ),
                flex: 3),
            Expanded(
                child: Text(
                  doctorData.toLowerCase(),
                  style: TextStyle(fontSize: 18.0),
                ),
                flex: 12),
          ],
        ));
  }
}

