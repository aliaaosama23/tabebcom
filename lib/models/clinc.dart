class Clinc {
  final String codeType;
  final String codeDefinition;
  final String codeDescriptionEn;
  final String codeDescriptionAr;
  final String codeUnique;

  Clinc({
    this.codeType,
    this.codeDefinition,
    this.codeDescriptionEn,
    this.codeDescriptionAr,
    this.codeUnique,
  });

  factory Clinc.fromJson(Map<String, dynamic> json) => Clinc(
        codeType: json["CodeType"],
        codeDefinition: json["CodeDefinition"],
        codeDescriptionEn: json["CodeDescriptionEn"],
        codeDescriptionAr: json["CodeDescriptionAr"],
        codeUnique: json["CodeUnique"],
      );

  Map<String, dynamic> toJson() => {
        "CodeType": codeType,
        "CodeDefinition": codeDefinition,
        "CodeDescriptionEn": codeDescriptionEn,
        "CodeDescriptionAr": codeDescriptionAr,
        "CodeUnique": codeUnique,
      };
}
