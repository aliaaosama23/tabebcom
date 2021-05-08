import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../models/doctor_appointments.dart';
import 'package:http/http.dart' as http;

Future<List<DoctorAppointment>> getDoctorAppointments(
    http.Client client, doctorCode, fkBranchID, iSTeleMed) async {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd hh:mm a');
  String formattedDate = formatter.format(now);
  print('current date is $formattedDate');
  var url='https://mcare.careofme.net/api/Doctor/GetDoctorAppointments?DoctorCode=$doctorCode&Fk_Branch_ID=$fkBranchID&StartDate=$formattedDate&IS_TeleMed=$iSTeleMed';
  final response = await client.get(Uri.parse(url));
 print('available appointments $url');
  return compute(parseDoctors, response.body);
}

List<DoctorAppointment> parseDoctors(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<DoctorAppointment>((json) => DoctorAppointment.fromJson(json))
      .toList();
}
