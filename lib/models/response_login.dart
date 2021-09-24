// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

import 'package:kontak/models/user.dart';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
    ResponseLogin({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    DataUser? data;

    factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        status: json["status"],
        message: json["message"],
        data: DataUser.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}


