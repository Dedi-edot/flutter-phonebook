import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kontak/models/contact.dart';

class Contacts with ChangeNotifier {
  List<GetContact> _contactList = [];

  List<GetContact> get contactList {
    return _contactList;
  }

  findByPhone(String phone) {
    return _contactList.firstWhere((element) => element.phone == phone);
  }

  findFirstName(String substring) {
    return _contactList.firstWhere((element) => element.name[0] == substring);
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

  filterContact(String val) {
    List<GetContact> filteredContact = [];
    var filterText = val.toLowerCase();
    if (val.length > 0) {
      filteredContact = [];
      contactList.forEach((contact) {
        if (contact.name.toLowerCase().contains(filterText) ||
            contact.phone.contains(val)) {
          filteredContact.add(contact);
        }
      });
      print(filteredContact);
      filteredContact.sort((a, b) => a.name.compareTo(b.name));
      return filteredContact;
    } else {
      contactList.sort((a, b) => a.name.compareTo(b.name));
      return contactList;
    }
  }
}
