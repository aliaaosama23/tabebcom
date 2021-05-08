
class Vaccine {
    Vaccine({
        this.vaccId,
        this.vaccVisit,
        this.vaccNameAr,
        this.vaccNameEn,
        this.status,
        this.vacVisitHeadDate,
        this.vacNextVisitDate,
        this.vacVisitHeadStatus,
        this.isOutVacc,
        this.isDone,
    });

    int vaccId;
    String vaccVisit;
    String vaccNameAr;
    String vaccNameEn;
    bool status;
    dynamic vacVisitHeadDate;
    dynamic vacNextVisitDate;
    dynamic vacVisitHeadStatus;
    bool isOutVacc;
    bool isDone;

    factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        vaccId: json["Vacc_ID"],
        vaccVisit: json["Vacc_Visit"],
        vaccNameAr: json["Vacc_Name_Ar"],
        vaccNameEn: json["Vacc_Name_En"],
        status: json["Status"],
        vacVisitHeadDate: json["Vac_Visit_Head_Date"],
        vacNextVisitDate: json["Vac_Next_Visit_Date"],
        vacVisitHeadStatus: json["Vac_Visit_Head_Status"],
        isOutVacc: json["IsOut_Vacc"],
        isDone: json["IsDone"],
    );

    Map<String, dynamic> toJson() => {
        "Vacc_ID": vaccId,
        "Vacc_Visit": vaccVisit,
        "Vacc_Name_Ar": vaccNameAr,
        "Vacc_Name_En": vaccNameEn,
        "Status": status,
        "Vac_Visit_Head_Date": vacVisitHeadDate,
        "Vac_Next_Visit_Date": vacNextVisitDate,
        "Vac_Visit_Head_Status": vacVisitHeadStatus,
        "IsOut_Vacc": isOutVacc,
        "IsDone": isDone,
    };
}
