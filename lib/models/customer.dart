// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
    List<Customer> data;

    CustomerModel({
        required this.data,
    });

    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        data: List<Customer>.from(json["data"].map((x) => Customer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Customer {
    String id;
    String name;
    String address;
    String phoneno;
    List<String> hadiah;

    Customer({
        required this.id,
        required this.name,
        required this.address,
        required this.phoneno,
        required this.hadiah,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phoneno: json["phoneno"],
        hadiah: List<String>.from(json["hadiah"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phoneno": phoneno,
        "hadiah": List<dynamic>.from(hadiah.map((x) => x)),
    };
}