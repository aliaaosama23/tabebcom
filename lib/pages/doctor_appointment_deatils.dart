import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/models/doctor_appointments.dart';

class DoctorAppointmentDetails extends StatelessWidget {

  final DoctorAppointmentElement appointmentDetails;
  DoctorAppointmentDetails({this.appointmentDetails});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('new appointment'),
        iconTheme: IconThemeData(color: Color(0xFF0ebcbb)),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Card(
              color: Color(0xFFe0e0e0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Text(appointmentDetails.appoPeriodAr.toString()))
                ],
              ),
              elevation: 3.0,
            ),
      )
    );
  }
}


