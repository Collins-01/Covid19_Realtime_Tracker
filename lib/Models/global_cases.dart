// To parse this JSON data, do
//
//     final GlobalCases = GlobalCasesFromJson(jsonString);

import 'dart:convert';

GlobalCases globalCasesFromJson(String str) =>
    GlobalCases.fromJson(json.decode(str));

String globalCasesToJson(GlobalCases data) => json.encode(data.toJson());

class GlobalCases {
  GlobalCases({
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
  });

  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  factory GlobalCases.fromJson(Map<String, dynamic> json) => GlobalCases(
        newConfirmed: json["NewConfirmed"],
        totalConfirmed: json["TotalConfirmed"],
        newDeaths: json["NewDeaths"],
        totalDeaths: json["TotalDeaths"],
        newRecovered: json["NewRecovered"],
        totalRecovered: json["TotalRecovered"],
      );

  Map<String, dynamic> toJson() => {
        "NewConfirmed": newConfirmed,
        "TotalConfirmed": totalConfirmed,
        "NewDeaths": newDeaths,
        "TotalDeaths": totalDeaths,
        "NewRecovered": newRecovered,
        "TotalRecovered": totalRecovered,
      };
}
