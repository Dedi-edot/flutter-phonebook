import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({Key? key}) : super(key: key);
  static const nameRoute = "/favorite_contacts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Favorit Contacts"),
    ));
  }
}
