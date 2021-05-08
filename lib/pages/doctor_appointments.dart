import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tabebcom_flutter/services/get_doctor_appointments.dart';
import 'package:tabebcom_flutter/utils/theme.dart';
import '../lang/helper.dart';
import '../models/doctor_appointments.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart';

import 'doctor_appointment_deatils.dart';

class DoctorAppointments extends StatelessWidget {
  final String title;
  final String doctorCode;
  final int fkBranchID;
  final bool iSTeleMed;

  DoctorAppointments({
    this.title,
    this.doctorCode,
    this.fkBranchID,
    this.iSTeleMed,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        iconTheme: IconThemeData(color: myThemeData.iconTheme.color),
        textTheme: TextTheme(headline6: myThemeData.primaryTextTheme.headline6),
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) print('error is ${snapshot.hasError}');
              return snapshot.hasData
                  ? DoctorAppointmentList(appointments: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
            future: getDoctorAppointments(
                http.Client(), doctorCode, fkBranchID, iSTeleMed),
          )),
    );
  }
}

class DoctorAppointmentList extends StatelessWidget {
  final List<DoctorAppointment> appointments;

  DoctorAppointmentList({Key key, this.appointments}) : super(key: key);
  final SwiperController _controller = SwiperController();
  @override
  Widget build(BuildContext context) {
    return appointments.length == 0
        ? Center(
            child: Text(
              getTranslated(context, 'no appointments'),
              style: TextStyle(color: myThemeData.primaryColor, fontSize: 20.0),
            ),
          )
        : new Swiper(
          autoplay: false,
          controller: _controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(flex:3,child:IconButton(onPressed: (){
                            print('go back');
                             _controller.previous(animation: true);
                          }, icon: Icon(Icons.arrow_back_ios))),
                          Expanded(flex:3,child:SizedBox()),
                          Expanded(
                            flex: 6,
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.0,
                              width: 120.0,
                              color: myThemeData.primaryColor,
                              child: Text(
                                DateFormat('yyyy-MM-dd')
                                    .format(appointments[index].date),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                         Expanded(flex:3,child:SizedBox()),
                          Expanded(flex:3,child:IconButton(onPressed: (){
                              _controller.next(animation: true);
                          }, icon: Icon(Icons.arrow_forward_ios))),
                        ],
                      )),
                  Expanded(
                    flex: 22,
                    child: Card(
                      borderOnForeground: true,
                      shadowColor: Colors.grey,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                          padding: EdgeInsets.all(4.0),
                          child: Expanded(
                            child: AppointmentList(
                              appointments:
                                  appointments[index].doctorAppointments,
                            ),
                          )),
                    ),
                  ),
                ],
              );
            },
            itemCount: appointments.length,
           // control: new SwiperControl(disableColor: Colors.cyanAccent),
          );
  }
}

class AppointmentList extends StatelessWidget {
  final List<DoctorAppointmentElement> appointments;

  AppointmentList({this.appointments});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: appointments.length,
        itemBuilder: (BuildContext context, int subindex) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return DoctorAppointmentDetails(
                    appointmentDetails: appointments[subindex]);
              }));
            },
            child: Container(
              height: 50.0,
              padding: EdgeInsets.all(0.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: EdgeInsets.all(6.0),
                elevation: 4.0,
                color: Color(0xFFFFFFFF), //cfcccc
                child: Center(
                  child: Text(
                    appointments[subindex].appoPeriodAr.toString(),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: myThemeData.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
