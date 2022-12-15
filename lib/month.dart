// To parse this JSON data, do
//
//     final month = monthFromJson(jsonString);

import 'dart:convert';

List<Month> monthFromJson(String str) =>
    List<Month>.from(json.decode(str).map((x) => Month.fromJson(x)));

String monthToJson(List<Month> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Month {
  Month({
    this.month,
    this.value,
  });

  String month;
  int value;

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        month: json["Month"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Month": month,
        "Value": value,
      };
}
