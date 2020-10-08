// To parse this JSON data, do
//
//     final topLevel = topLevelFromJson(jsonString);

import 'dart:convert';

import 'Ahya.dart';

List<Surah> surahFromJson(String str) => List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

String surahToJson(List<Surah> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Surah {
  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  List<Ayah> ayahs;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
    number: json["number"],
    name: json["name"],
    englishName: json["englishName"],
    englishNameTranslation: json["englishNameTranslation"],
    revelationType: json["revelationType"],
    ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "englishName": englishName,
    "englishNameTranslation": englishNameTranslation,
    "revelationType": revelationType,
    "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
  };
}

