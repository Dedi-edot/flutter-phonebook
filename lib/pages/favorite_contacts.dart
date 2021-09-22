// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kontak/db_helper.dart';
import 'package:kontak/models/fav_contact.dart';
// import 'package:kontak/pages/detail_contact.dart';
import 'package:kontak/pages/new_contact.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({Key? key}) : super(key: key);
  static const nameRoute = "/favorite_contacts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDCDCDC),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffDCDCDC),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(NewContact.nameRoute);
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.black,
                  ))
            ],
            title: Text(
              "My Contacts",
              style: TextStyle(color: Colors.black),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search contact",
                      fillColor: Color(0xffBEBEBE),
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            )),
        body: FutureBuilder<List<FavContact>>(
            future: DatabaseHelper.instance.getGroceries(),
            builder: (BuildContext context,
                AsyncSnapshot<List<FavContact>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? Center(child: Text('No Groceries in List.'))
                  : Center(child: Text("H"));
            }
            ),
            );
  }
}
