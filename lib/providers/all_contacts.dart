import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kontak/models/contact.dart';
import 'package:kontak/models/response_get_allcontact.dart';

class Contacts with ChangeNotifier {
  List<Contact> _contactList = [];

  List<Contact> get contactList {
    return _contactList;
  }

  Contact findByPhone(String phone) {
    return _contactList.firstWhere((element) => element.phone == phone);
  }

  void changeIsFav(String phone, bool isFav) {
    var index = contactList
        .indexOf(_contactList.firstWhere((element) => element.phone == phone));
    contactList[index].isFav = isFav;
    notifyListeners();
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
      allContacts.forEach((element) {
        _contactList.add(Contact(element.id, element.name, element.phone,
            element.email, element.company, element.job, element.image, false));
      });
      print("BERHASIL MASUKAN DATA LIST");

      notifyListeners();
    }
  }
}
