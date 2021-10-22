import 'package:flutter/foundation.dart';
import '../models/clinc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Clinc>> getClincs(http.Client client) async {
  final response = await client.get(
      Uri.parse('/api/Clinic/GetClinicsByBranch/0'));

      if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
     return compute(parsePhotos, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load specialzations');
  }
 
}

List<Clinc> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Clinc>((json) => Clinc.fromJson(json)).toList();
}
