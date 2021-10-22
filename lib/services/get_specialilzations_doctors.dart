import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/doctor.dart';
import 'package:http/http.dart' as http;

Future<List<Doctor>> getDoctorsBySpeciality(http.Client client,
    speciality, double lat, double long) async {
  print('lat is $lat');
  print('long is $long');
   var url='/api/Doctor/GetDoctors?DoctorSpeciality=$speciality&Branch_ID=null&ClinicDept_Code=null&lat=$lat&long=$long&DistanceKilos=50';
   final response = await client.get(
      Uri.parse(url));
      print(url);
  return compute(parseDoctors, response.body);
}

List<Doctor> parseDoctors(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Doctor>((json) => Doctor.fromJson(json)).toList();
}
