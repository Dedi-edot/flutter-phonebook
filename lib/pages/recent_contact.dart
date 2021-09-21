import 'package:flutter/material.dart';

class RecentContacts extends StatelessWidget {
  const RecentContacts({Key? key}) : super(key: key);
  static const nameRoute = "/recent_contacts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Recent Contact"),
    ));
  }
}
