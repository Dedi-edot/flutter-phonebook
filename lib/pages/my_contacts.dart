import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kontak/models/contact.dart';
import 'package:kontak/pages/detail_contact.dart';
import 'package:kontak/pages/new_contact.dart';

class MyContacts extends StatefulWidget {
  const MyContacts({Key? key}) : super(key: key);
  static const nameRoute = "/my_contacts";

  @override
  _MyContactsState createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  List<Contact> contactList = [
    Contact('Andi', '081234567890', 'andi@mail.com', 'Refactory',
        'Fullstack Engineer'),
    Contact('Budi', '082312345678', 'budi@mail.com', 'Bixbox', 'Desainer'),
    Contact('Bani', '082312345678', 'bani@mail.com', 'Bixbox', 'Backend'),
    Contact('Cacha', '085712345678', 'cacha@mail.com', 'Refactory', 'QA'),
    Contact('Dian', '0899676541234', 'dian@mail.com', 'Bixbox', 'Front End')
  ];

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
      body: ListView.separated(
        itemCount: contactList.length,
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Container(child: Text("A")),
          );
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffC4C4C4),
                    borderRadius: BorderRadius.circular(20)
                    ),
                  child: CachedNetworkImage(
                    width: 40,
                  imageUrl: "https://cdn.icon-icons.com/icons2/1674/PNG/512/person_110935.png",
                  progressIndicatorBuilder: (context, url, downloadProgress) => 
                    CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                 ),
                 ),
                title: Text(contactList[index].name),
                subtitle: Text(contactList[index].phone),
                trailing: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(DetailContact.nameRoute);
                    },
                    child: Image.asset("assets/icons/more1.png"))),
          );
        },
      ),
    );
  }
}
