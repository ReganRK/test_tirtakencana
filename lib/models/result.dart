// To parse this JSON data, do
//
//     final result = resultFromJson(jsonString);

import 'dart:convert';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
    List<Datum> data;

    Result({
        required this.data,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String custId;
    int received;
    String receivedDate;
    String failedReason;

    Datum({
        required this.custId,
        required this.received,
        required this.receivedDate,
        required this.failedReason,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        custId: json["CustID"],
        received: json["Received"],
        receivedDate: json["ReceivedDate"],
        failedReason: json["FailedReason"],
    );

    Map<String, dynamic> toJson() => {
        "CustID": custId,
        "Received": received,
        "ReceivedDate": receivedDate,
        "FailedReason": failedReason,
    };
}
