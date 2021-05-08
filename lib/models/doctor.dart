class Doctor {
  Doctor({
    this.fkClinicDeptCode,
    this.clinicDeptBranchId,
    this.clinicDeptCode,
    this.clinicDeptNameEn,
    this.clinicDeptNameAr,
    this.clinicType,
    this.doctorCode,
    this.doctorNameAr,
    this.doctorNameEn,
    this.doctorCategory,
    this.fkBranchId,
    this.officialAddress,
    this.resAddress,
    this.phone,
    this.mobileNumber,
    this.fax,
    this.email,
    this.qualification,
    this.specializationEn,
    this.specializationAr,
    this.specialization,
    this.remarks,
    this.mohNo,
    this.idNo,
    this.docAlterCode,
    this.costNo,
    this.active,
    this.signatureImgName,
    this.signatureImg,
    this.fkUserId,
    this.fkDrCommisionAccNo,
    this.fkAccountNo,
    this.doctorFlag,
    this.briefSummary,
    this.doctorOperationValue,
    this.isOut,
    this.doctorGender,
    this.fkSellerId,
    this.doctorClinicDeptStatus,
    this.doctorClinicDeptId,
    this.branchId,
    this.branchName,
    this.branchNameAr,
    this.orgName,
    this.orgNameAr,
    this.long,
    this.lat,
    this.distance,
    this.doctorPic,
    this.avgRate,
    this.totalCnt,
    this.isTeleMed,
    this.orgId,
  });

  final String fkClinicDeptCode;
  final int clinicDeptBranchId;
  final String clinicDeptCode;
  final String clinicDeptNameEn;
  final String clinicDeptNameAr;
  final dynamic clinicType;
  final String doctorCode;
  final String doctorNameAr;
  final String doctorNameEn;
  final String doctorCategory;
  final int fkBranchId;
  final String officialAddress;
  final String resAddress;
  final String phone;
  final String mobileNumber;
  final String fax;
  final String email;
  final String qualification;
  final String specializationEn;
  final String specializationAr;
  final String specialization;
  final String remarks;
  final String mohNo;
  final String idNo;
  final String docAlterCode;
  final String costNo;
  final bool active;
  final String signatureImgName;
  final dynamic signatureImg;
  final int fkUserId;
  final dynamic fkDrCommisionAccNo;
  final dynamic fkAccountNo;
  final double doctorFlag;
  final String briefSummary;
  final double doctorOperationValue;
  final bool isOut;
  final String doctorGender;
  final dynamic fkSellerId;
  final bool doctorClinicDeptStatus;
  final int doctorClinicDeptId;
  final int branchId;
  final String branchName;
  final String branchNameAr;
  final String orgName;
  final String orgNameAr;
  final double long;
  final double lat;
  final double distance;
  final String doctorPic;
  final int avgRate;
  final int totalCnt;
  final bool isTeleMed;
  final int orgId;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        fkClinicDeptCode: json["FK_ClinicDept_Code"],
        clinicDeptBranchId: json["ClinicDept_BranchId"],
        clinicDeptCode: json["ClinicDept_Code"],
        clinicDeptNameEn: json["ClinicDept_Name_En"],
        clinicDeptNameAr: json["ClinicDept_Name_Ar"],
        clinicType: json["ClinicType"],
        doctorCode: json["DoctorCode"],
        doctorNameAr: json["DoctorNameAr"],
        doctorNameEn: json["DoctorNameEn"],
        doctorCategory: json["DoctorCategory"],
        fkBranchId: json["FK_Branch_ID"],
        officialAddress: json["OfficialAddress"],
        resAddress: json["ResAddress"],
        phone: json["Phone"],
        mobileNumber: json["MobileNumber"],
        fax: json["Fax"],
        email: json["Email"],
        qualification: json["Qualification"],
        specializationEn: json["SpecializationEn"],
        specializationAr: json["SpecializationAr"],
        specialization: json["Specialization"],
        remarks: json["Remarks"],
        mohNo: json["MOHNo"],
        idNo: json["IDNo"],
        docAlterCode: json["Doc_Alter_Code"],
        costNo: json["CostNo"],
        active: json["Active"],
        signatureImgName: json["Signature_Img_Name"],
        signatureImg: json["Signature_Img"],
        fkUserId: json["Fk_User_ID"],
        fkDrCommisionAccNo: json["FK_Dr_CommisionAccNo"],
        fkAccountNo: json["FK_AccountNo"],
        doctorFlag: json["DoctorFlag"],
        briefSummary: json["BriefSummary"],
        doctorOperationValue: json["Doctor_Operation_Value"],
        isOut: json["IS_Out"],
        doctorGender: json["DoctorGender"],
        fkSellerId: json["FK_Seller_ID"],
        doctorClinicDeptStatus: json["Doctor_ClinicDept_Status"],
        doctorClinicDeptId: json["Doctor_ClinicDeptID"],
        branchId: json["Branch_ID"],
        branchName: json["Branch_Name"],
        branchNameAr: json["Branch_Name_Ar"],
        orgName: json["Org_Name"],
        orgNameAr: json["Org_Name_Ar"],
        long: json["Long"].toDouble(),
        lat: json["Lat"].toDouble(),
        distance: json["Distance"],
        doctorPic: json["DoctorPic"],
        avgRate: json["AvgRate"],
        totalCnt: json["TotalCnt"],
        isTeleMed: json["IS_TeleMed"],
        orgId: json["Org_ID"],
      );
}
