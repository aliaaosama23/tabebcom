import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/lang/helper.dart';
import '../models/doctor.dart';
import '../pages/doctor_appointments.dart';
import '../utils/theme.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DoctorDetails extends StatelessWidget {
  final Doctor doctor;
  final String title;
  final String locale;
  DoctorDetails({this.title, this.doctor, this.locale});

  @override
  Widget build(BuildContext context) {
    print('doctor details ${this.doctor}');
    inspect(this.doctor);
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        title: Text(title),
        iconTheme: IconThemeData(color: myThemeData.iconTheme.color),
        textTheme: TextTheme(headline6: myThemeData.primaryTextTheme.headline6),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 16.0, left: 16.0, top: 10.0, bottom: 10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.asset(
                  "assets/images/avatar.png",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.3,
                )),
          ),
          Container(
            height: 30.0,
            child: ListTile(
              leading: Icon(
                FontAwesome.stethoscope,
                color: myThemeData.primaryColor,
              ),
              title: Text(
                locale == "ar_SA"
                    ? doctor.specializationAr
                    : doctor.specializationEn,
              ),
              // trailing: Row(
              //   children: [
              //     Expanded(
              //         child: Text(
              //           doctor.avgRate.toString(),
              //           style: TextStyle(fontSize: 18.0),
              //         ),
              //         flex: 2),
              //     Expanded(
              //         child: Card(
              //           elevation: 4.0,
              //           child: Icon(
              //             Icons.star,
              //             color: Colors.yellow,
              //           ),
              //         ),
              //         flex: 2),
              //   ],
              // ),
            ),
          ),
          Container(
            height: 30.0,
            child: ListTile(
              leading: Icon(
                Icons.place_outlined,
                color: myThemeData.primaryColor,
              ),
              title: Text(
                doctor.officialAddress,
              ),
            ),
          ),
          Container(
            height: 30.0,
            child: ListTile(
              leading: Icon(
                Icons.phone_in_talk_outlined,
                color: myThemeData.primaryColor,
              ),
              title: Text(
                doctor.mobileNumber,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.only(right: 16.0, left: 16.0),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      height: 40.0,
                      child: ElevatedButton(
                        child: Text(
                          getTranslated(context, 'book').toUpperCase(),
                        ),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              myThemeData.primaryColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0))),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return DoctorAppointments(
                              title: locale == "ar_SA"
                                  ? doctor.doctorNameAr
                                  : doctor.doctorNameEn,
                              doctorCode: doctor.doctorCode,
                              fkBranchID: doctor.fkBranchId,
                              iSTeleMed: doctor.isTeleMed,
                            );
                          }));
                        },
                      ),
                    ),
                    flex: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
