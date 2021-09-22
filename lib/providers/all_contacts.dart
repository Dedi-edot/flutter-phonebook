import 'package:flutter/material.dart';
import 'package:kontak/models/contact.dart';


class Contacts with ChangeNotifier {
  List<Contact> _contactList = [
    Contact(
      1, 'Andi', '081234567890', 'andi@mail.com', 'Refactory','Fullstack Engineer'),
    Contact(
      2,'Budi', '082312345678', 'budi@mail.com', 'Bixbox', 'Desainer'),
    Contact(
      3,'Bani', '082312345678', 'bani@mail.com', 'Bixbox', 'Backend'),
    Contact(
      4,'Cacha', '085712345678', 'cacha@mail.com', 'Refactory', 'QA'),
    Contact(
      5,'Dian', '0899676541234', 'dian@mail.com', 'Bixbox', 'Front End'),
  ];

  List<Contact> get contactList {
    return _contactList;
  }

  Contact findByPhone(phone) {
    return _contactList.firstWhere((element) => element.phone == phone);
  }
}
