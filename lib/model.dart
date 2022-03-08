// To parse this JSON data, do
//
//     final quebank = quebankFromJson(jsonString);

import 'dart:convert';

List<Quebank> quebankFromJson(String str) =>
    List<Quebank>.from(json.decode(str).map((x) => Quebank.fromJson(x)));

String quebankToJson(List<Quebank> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quebank {
  Quebank({
    this.srno,
    this.volume,
    this.mon1,
    this.yr1,
    this.question,
    this.queBroadSubject,
    this.mcqO1,
    this.mcqO2,
    this.mcqO3,
    this.mcqO4,
    this.mcqAk,
    this.descAk,
    this.status,
    this.queNo,
    this.queAns,
    this.rndNo,
    this.diffLevel,
    this.siteAddress,
    this.addDt,
  });

  int srno;
  String volume;
  int mon1;
  int yr1;
  String question;
  dynamic queBroadSubject;
  String mcqO1;
  String mcqO2;
  String mcqO3;
  String mcqO4;
  String mcqAk;
  String descAk;
  dynamic status;
  dynamic queNo;
  dynamic queAns;
  dynamic rndNo;
  int diffLevel;
  String siteAddress;
  AddDt addDt;

  factory Quebank.fromJson(Map<String, dynamic> json) => Quebank(
        srno: json["srno"],
        volume: json["volume"],
        mon1: json["Mon1"],
        yr1: json["yr1"],
        question: json["Question"],
        queBroadSubject: json["Que_Broad_Subject"],
        mcqO1: json["MCQ_O1"],
        mcqO2: json["MCQ_O2"],
        mcqO3: json["MCQ_O3"],
        mcqO4: json["MCQ_O4"],
        mcqAk: json["MCQ_AK"],
        descAk: json["Desc_AK"] == null ? null : json["Desc_AK"],
        status: json["Status"],
        queNo: json["Que_No"],
        queAns: json["queAns"],
        rndNo: json["rnd_no"],
        diffLevel: json["diff_Level"] == null ? null : json["diff_Level"],
        siteAddress: json["Site_Address"] == null ? null : json["Site_Address"],
        addDt: json["Add_Dt"] == null ? null : addDtValues.map[json["Add_Dt"]],
      );

  Map<String, dynamic> toJson() => {
        "srno": srno,
        "volume": volume,
        "Mon1": mon1,
        "yr1": yr1,
        "Question": question,
        "Que_Broad_Subject": queBroadSubject,
        "MCQ_O1": mcqO1,
        "MCQ_O2": mcqO2,
        "MCQ_O3": mcqO3,
        "MCQ_O4": mcqO4,
        "MCQ_AK": mcqAk == null ? null : mcqAkValues.reverse[mcqAk],
        "Desc_AK": descAk == null ? null : descAk,
        "Status": status,
        "Que_No": queNo,
        "queAns": queAns,
        "rnd_no": rndNo,
        "diff_Level": diffLevel == null ? null : diffLevel,
        "Site_Address": siteAddress == null ? null : siteAddress,
        "Add_Dt": addDt == null ? null : addDtValues.reverse[addDt],
      };
}

enum AddDt {
  THE_21_JAN_16,
  THE_16_OCT_15,
  THE_01_SEP_15,
  THE_02_FEB_16,
  THE_26_OCT_15,
  THE_29_DEC_15,
  THE_21_APR_16,
  THE_08_FEB_16,
  THE_10_FEB_16,
  THE_20_MAY_16,
  THE_10_MAR_16,
  THE_31_MAR_16,
  THE_14_SEP_16,
  THE_01_SEP_16,
  THE_15_JUN_16,
  THE_16_JUN_16,
  THE_04_JUL_16,
  THE_13_JUL_16,
  THE_18_JUL_16,
  THE_31_AUG_16,
  THE_02_SEP_16,
  THE_19_SEP_16,
  THE_31_DEC_18,
  THE_10_OCT_16,
  THE_13_OCT_16,
  THE_31_OCT_16,
  THE_29_DEC_16,
  THE_13_JAN_17,
  THE_28_MAR_17,
  THE_13_MAY_17,
  THE_24_MAR_18,
  THE_05_APR_18,
  THE_14_DEC_21,
  THE_05_JAN_21
}

final addDtValues = EnumValues({
  "01-Sep-15": AddDt.THE_01_SEP_15,
  "01-Sep-16": AddDt.THE_01_SEP_16,
  "02-Feb-16": AddDt.THE_02_FEB_16,
  "02-Sep-16": AddDt.THE_02_SEP_16,
  "04-Jul-16": AddDt.THE_04_JUL_16,
  "05-Apr-18": AddDt.THE_05_APR_18,
  "05-Jan-21": AddDt.THE_05_JAN_21,
  "08-Feb-16": AddDt.THE_08_FEB_16,
  "10-Feb-16": AddDt.THE_10_FEB_16,
  "10-Mar-16": AddDt.THE_10_MAR_16,
  "10-Oct-16": AddDt.THE_10_OCT_16,
  "13-Jan-17": AddDt.THE_13_JAN_17,
  "13-Jul-16": AddDt.THE_13_JUL_16,
  "13-May-17": AddDt.THE_13_MAY_17,
  "13-Oct-16": AddDt.THE_13_OCT_16,
  "14-Dec-21": AddDt.THE_14_DEC_21,
  "14-Sep-16": AddDt.THE_14_SEP_16,
  "15-Jun-16": AddDt.THE_15_JUN_16,
  "16-Jun-16": AddDt.THE_16_JUN_16,
  "16-Oct-15": AddDt.THE_16_OCT_15,
  "18-Jul-16": AddDt.THE_18_JUL_16,
  "19-Sep-16": AddDt.THE_19_SEP_16,
  "20-May-16": AddDt.THE_20_MAY_16,
  "21-Apr-16": AddDt.THE_21_APR_16,
  "21-Jan-16": AddDt.THE_21_JAN_16,
  "24-Mar-18": AddDt.THE_24_MAR_18,
  "26-Oct-15": AddDt.THE_26_OCT_15,
  "28-Mar-17": AddDt.THE_28_MAR_17,
  "29-Dec-15": AddDt.THE_29_DEC_15,
  "29-Dec-16": AddDt.THE_29_DEC_16,
  "31-Aug-16": AddDt.THE_31_AUG_16,
  "31-Dec-18": AddDt.THE_31_DEC_18,
  "31-Mar-16": AddDt.THE_31_MAR_16,
  "31-Oct-16": AddDt.THE_31_OCT_16
});

enum McqAk { A, D, C, B, EMPTY, H, MCQ_AK }

final mcqAkValues = EnumValues({
  "A": McqAk.A,
  "B": McqAk.B,
  "C": McqAk.C,
  "D": McqAk.D,
  " ": McqAk.EMPTY,
  "H": McqAk.H,
  ")": McqAk.MCQ_AK
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
