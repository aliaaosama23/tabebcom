import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/vaccine.dart';
import 'package:http/http.dart' as http;

Future<List<Vaccine>> getPatientVaccination(
    http.Client client, int patientCode) async {
  final response = await client.get(Uri.parse(
      'https://mcare.careofme.net/api/Patient/GetPatientVaccination/$patientCode'));
  return compute(parsPatientVaccination, response.body);
}

List<Vaccine> parsPatientVaccination(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Vaccine>((json) => Vaccine.fromJson(json)).toList();
}
