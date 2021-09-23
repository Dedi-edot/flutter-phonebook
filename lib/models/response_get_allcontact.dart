// To parse this JSON data, do
//
//     final responseGetAllContact = responseGetAllContactFromJson(jsonString);

import 'dart:convert';

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

class GetContact {
    GetContact({
        this.id,
        this.name,
        this.phone,
        this.job,
        this.company,
        this.image,
        this.email,
    });

    int? id;
    String? name;
    String? phone;
    String? job;
    String? company;
    String? image;
    String? email;

    factory GetContact.fromJson(Map<String, dynamic> json) => GetContact(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        job: json["job"] == null ? null : json["job"],
        company: json["company"] == null ? null : json["company"],
        image: json["image"] == null ? null : json["image"],
        email: json["email"] == null ? null : json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "job": job == null ? null : job,
        "company": company == null ? null : company,
        "image": image == null ? null : image,
        "email": email == null ? null : email,
    };
}

// enum Company { REFACTORY }

// final companyValues = EnumValues({
//     "Refactory": Company.REFACTORY
// });

// class EnumValues<T> {
//     Map<String, T>? map;
//     Map<T, String>? reverseMap;

//     EnumValues(this.map);

//     Map<T, String>? get reverse {
//         if (reverseMap == null) {
//             reverseMap = map!.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
