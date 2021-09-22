import 'package:flutter/material.dart';
import 'package:kontak/pages/detail_contact.dart';
import 'package:kontak/pages/favorite_contacts.dart';
import 'package:kontak/pages/home_page.dart';
import 'package:kontak/pages/login.dart';
import 'package:kontak/pages/my_contacts.dart';
import 'package:kontak/pages/new_contact.dart';
import 'package:kontak/pages/recent_contact.dart';
import 'package:kontak/pages/register.dart';
import 'package:kontak/providers/all_contacts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Contacts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Kontak',
        home: LoginPage(),
        routes: {
          LoginPage.nameRoute : (context) => LoginPage(),
          RegisterPage.nameRoute : (context) => RegisterPage(),
          HomePage.nameRoute : (context) => HomePage(),
          MyContacts.nameRoute : (context) => MyContacts(),
          NewContact.nameRoute : (context) => NewContact(),
          FavoriteContacts.nameRoute : (context) => FavoriteContacts(),
          RecentContacts.nameRoute : (context) => RecentContacts(),
          DetailContact.nameRoute : (context) => DetailContact(),
        } ,
      ),
    );
  }
}

