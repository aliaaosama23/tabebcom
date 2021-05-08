import 'package:flutter/material.dart';
import 'package:tabebcom_flutter/utils/theme.dart';

class UserVisits extends StatelessWidget {
  final String title;

  UserVisits({this.title});
  @override

  Widget build(BuildContext context) {
    return 
    Scaffold(
    backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
          iconTheme: IconThemeData(color: myThemeData.iconTheme.color),
          textTheme:
              TextTheme(headline6: myThemeData.primaryTextTheme.headline6),
        ),
        body: Center(child: Center(child: Text('vidits')),));
  }
}



// Future<List<Clinc>> getClincs(http.Client client) async {
//   final response = await client.get(
//       Uri.parse('https://mcare.careofme.net/api/Clinic/GetClinicsByBranch/0'));

//   // Use the compute function to run parsePhotos in a separate isolate.
//   return compute(parsePhotos, response.body);
// }

// // A function that converts a response body into a List<Photo>.
// List<Clinc> parsePhotos(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Clinc>((json) => Clinc.fromJson(json)).toList();
// }
