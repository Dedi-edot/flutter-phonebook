// To parse this JSON data, do
//
//     final responseGetAllContact = responseGetAllContactFromJson(jsonString);

import 'dart:convert';

import 'package:kontak/models/contact.dart';

ResponseGetAllContact responseGetAllContactFromJson(String str) => ResponseGetAllContact.fromJson(json.decode(str));

String responseGetAllContactToJson(ResponseGetAllContact data) => json.encode(data.toJson());

class ResponseGetAllContact {
    ResponseGetAllContact({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    List<GetContact>? data;

    factory ResponseGetAllContact.fromJson(Map<String, dynamic> json) => ResponseGetAllContact(
        status: json["status"],
        message: json["message"],
        data: List<GetContact>.from(json["data"].map((x) => GetContact.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}



