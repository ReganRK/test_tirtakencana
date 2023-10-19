// To parse this JSON data, do
//
//     final totalHadiah = totalHadiahFromJson(jsonString);

import 'dart:convert';

TotalHadiah totalHadiahFromJson(String str) => TotalHadiah.fromJson(json.decode(str));

String totalHadiahToJson(TotalHadiah data) => json.encode(data.toJson());

class TotalHadiah {
    List<Hadiah> data;

    TotalHadiah({
        required this.data,
    });

    factory TotalHadiah.fromJson(Map<String, dynamic> json) => TotalHadiah(
        data: List<Hadiah>.from(json["data"].map((x) => Hadiah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Hadiah {
    String jenis;
    String qty;
    String unit;

    Hadiah({
        required this.jenis,
        required this.qty,
        required this.unit,
    });

    factory Hadiah.fromJson(Map<String, dynamic> json) => Hadiah(
        jenis: json["Jenis"],
        qty: json["Qty"],
        unit: json["Unit"],
    );

    Map<String, dynamic> toJson() => {
        "Jenis": jenis,
        "Qty": qty,
        "Unit": unit,
    };
}
