import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kontak/models/contact.dart';

class Contacts with ChangeNotifier {
  List<GetContact> _contactList = [];

  List<GetContact> get contactList {
    return _contactList;
  }

  GetContact findByPhone(String phone) {
    return _contactList.firstWhere((element) => element.phone == phone);
  }

  Future<void> initialData(String token) async {
    String url = "https://phone-book-api.herokuapp.com/api/v1/contacts";
    List<GetContact> allContacts;

    Response response;
    Dio dio = new Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    response = await dio.get(url);

    allContacts = List<GetContact>.from(
        response.data["data"].map((x) => GetContact.fromJson(x)));

    if (allContacts.length > 0) {
      allContacts.forEach((contact) {
        _contactList.add(contact);
      });
      print("BERHASIL MASUKAN DATA LIST");

      notifyListeners();
    }
  }

  // List<GetContact> search(String val) {
  //   var filteredContact = _contactList.where((contact) {
  //     contact.name!.contains(val) || contact.phone!.contains(val);
  //   }) as List<GetContact>;

  //   return filteredContact;
  // }
}
