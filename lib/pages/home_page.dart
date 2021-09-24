import 'package:flutter/material.dart';
import 'package:kontak/pages/favorite_contacts.dart';
import 'package:kontak/pages/my_contacts.dart';
import 'package:kontak/pages/recent_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const nameRoute = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedNavbar = 1;
  List<Widget> navbarPage = [
    RecentContacts(),
    MyContacts(),
    FavoriteContacts(),
  ];

  void _changeSelectedNavbar(int index) {
    setState(() {
      selectedNavbar = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navbarPage[selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/recent.png"), 
            label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined, size: 35,), 
            activeIcon: Icon(Icons.person, size: 35,),
            label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade_outlined, size: 35,),
            activeIcon: Icon(Icons.grade, size: 35,),
            label: ""),
        ],
        currentIndex: selectedNavbar,
        onTap: _changeSelectedNavbar,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        backgroundColor: Color(0xffC4C4C4),
      ),
    );
  }
}
