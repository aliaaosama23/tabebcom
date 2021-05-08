class DoctorAppointment {
  DoctorAppointment({
    this.date,
    this.doctorAppointments,
  });

  DateTime date;
  List<DoctorAppointmentElement> doctorAppointments;

  factory DoctorAppointment.fromJson(Map<String, dynamic> json) =>
      DoctorAppointment(
        date: DateTime.parse(json["Date"]),
        doctorAppointments: List<DoctorAppointmentElement>.from(
            json["DoctorAppointments"]
                .map((x) => DoctorAppointmentElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "DoctorAppointments":
            List<dynamic>.from(doctorAppointments.map((x) => x.toJson())),
      };
}

class DoctorAppointmentElement {
  DoctorAppointmentElement({
    this.appoId,
    this.startTime,
    this.endTime,
    this.appoPeriod,
    this.appoPeriodAr,
    this.isclosed,
    this.isDrShift,
    this.isReserved,
    this.teleMedConsultPrice,
  });

  int appoId;
  String startTime;
  String endTime;
  String appoPeriod;
  String appoPeriodAr;
  bool isclosed;
  bool isDrShift;
  bool isReserved;
  double teleMedConsultPrice;

  factory DoctorAppointmentElement.fromJson(Map<String, dynamic> json) =>
      DoctorAppointmentElement(
        appoId: json["Appo_ID"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        appoPeriod: json["Appo_Period"],
        appoPeriodAr: json["Appo_PeriodAr"],
        isclosed: json["isclosed"],
        isDrShift: json["ISDr_Shift"],
        isReserved: json["IsReserved"],
        teleMedConsultPrice: json["TeleMedConsult_Price"],
      );

  Map<String, dynamic> toJson() => {
        "Appo_ID": appoId,
        "startTime": startTime,
        "endTime": endTime,
        "Appo_Period": appoPeriod,
        "Appo_PeriodAr": appoPeriodAr,
        "isclosed": isclosed,
        "ISDr_Shift": isDrShift,
        "IsReserved": isReserved,
        "TeleMedConsult_Price": teleMedConsultPrice,
      };
}

// class DoctorAppointment {
//   DoctorAppointment({
//     this.date,
//     this.doctorAppointments,
//   });

//   DateTime date;
//   List<dynamic> doctorAppointments;

//   factory DoctorAppointment.fromJson(Map<String, dynamic> json) =>
//       DoctorAppointment(
//         date: DateTime.parse(json["Date"]),
//         doctorAppointments:
//             List<dynamic>.from(json["DoctorAppointments"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "Date":
//             "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//         "DoctorAppointments":
//             List<dynamic>.from(doctorAppointments.map((x) => x)),
//       };
// }

// ///////////////
// class DoctorAppointments {
//   List<Appointment> appointmentList;
//   String date;

//   DoctorAppointments({this.appointmentList, this.date});

//   factory DoctorAppointments.fromJson(Map<String, dynamic> json) =>
//       DoctorAppointments(
//           date: json["Date"], appointmentList: json["DoctorAppointments"]);
// }

// class Appointment {
//   Appointment({
//     this.appoId,
//     this.startTime,
//     this.endTime,
//     this.appoPeriod,
//     this.appoPeriodAr,
//     this.isclosed,
//     this.isDrShift,
//     this.isReserved,
//     this.teleMedConsultPrice,
//   });

//   int appoId;
//   String startTime;
//   String endTime;
//   String appoPeriod;
//   String appoPeriodAr;
//   bool isclosed;
//   bool isDrShift;
//   bool isReserved;
//   double teleMedConsultPrice;

//   factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
//         appoId: json["Appo_ID"],
//         startTime: json["startTime"],
//         endTime: json["endTime"],
//         appoPeriod: json["Appo_Period"],
//         appoPeriodAr: json["Appo_PeriodAr"],
//         isclosed: json["isclosed"],
//         isDrShift: json["ISDr_Shift"],
//         isReserved: json["IsReserved"],
//         teleMedConsultPrice: json["TeleMedConsult_Price"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Appo_ID": appoId,
//         "startTime": startTime,
//         "endTime": endTime,
//         "Appo_Period": appoPeriod,
//         "Appo_PeriodAr": appoPeriodAr,
//         "isclosed": isclosed,
//         "ISDr_Shift": isDrShift,
//         "IsReserved": isReserved,
//         "TeleMedConsult_Price": teleMedConsultPrice,
//       };
// }
