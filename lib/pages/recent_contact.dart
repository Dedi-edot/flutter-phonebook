import 'package:flutter/material.dart';
import 'package:kontak/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentContacts extends StatelessWidget {
  const RecentContacts({Key? key}) : super(key: key);
  static const nameRoute = "/recent_contacts";

  @override
  Widget build(BuildContext context) {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    Future logout() async {
      final SharedPreferences prefs = await _prefs;

      prefs.remove('token').then((value) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(LoginPage.nameRoute, (route) => false);
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 27,
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xffE94560)),
              onPressed: () {
                logout();
              },
              child: Text(
                "LOGOUT",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
