
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:kontak/models/user.dart';

class Products with ChangeNotifier {
  String urlMaster = "https://phone-book-api.herokuapp.com/api/";
  late User _user;

  User get user => _user;

  Future<void> login(String name, String password) async {
    
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "title": title,
          "price": price,
          "createdAt": dateNow.toString(),
          "updatedAt": dateNow.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product data = Product(
          id: json.decode(response.body)["name"].toString(),
          title: title,
          price: price,
          createdAt: dateNow,
          updatedAt: dateNow,
        );

        _allProduct.add(data);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }
