// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
    List<Datum> data;

    Customer({
        required this.data,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String custId;
    String name;
    String address;
    String branchCode;
    String phoneNo;
    List<String> hadiah;

    Datum({
        required this.custId,
        required this.name,
        required this.address,
        required this.branchCode,
        required this.phoneNo,
        required this.hadiah,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        custId: json["CustID"],
        name: json["Name"],
        address: json["Address"],
        branchCode: json["BranchCode"],
        phoneNo: json["PhoneNo"],
        hadiah: List<String>.from(json["hadiah"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "CustID": custId,
        "Name": name,
        "Address": address,
        "BranchCode": branchCode,
        "PhoneNo": phoneNo,
        "hadiah": List<dynamic>.from(hadiah.map((x) => x)),
    };
}
