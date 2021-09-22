import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kontak/db/db_helper.dart';
import 'package:kontak/models/fav_model.dart';
import 'package:kontak/providers/all_contacts.dart';
import 'package:provider/provider.dart';
import 'package:kontak/pages/detail_contact.dart';
import 'package:kontak/pages/new_contact.dart';

class MyContacts extends StatefulWidget {
  const MyContacts({Key? key}) : super(key: key);
  static const nameRoute = "/my_contacts";

  @override
  _MyContactsState createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  @override
  Widget build(BuildContext context) {
    final contactData = Provider.of<Contacts>(context);
    final contactList = contactData.contactList;

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
              onLongPress: () {
                Navigator.of(context).pushNamed(DetailContact.nameRoute,
                          arguments: contactList[index].phone);
              },
                leading: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(20)),
                  child: CachedNetworkImage(
                    width: 40,
                    imageUrl:
                        "https://cdn.icon-icons.com/icons2/1674/PNG/512/person_110935.png",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                title: Text(contactList[index].name),
                subtitle: Text(contactList[index].phone),
                trailing: GestureDetector(
                    onTap: () async {
                      await DatabaseHelper.instance.add(
                      FavModel(
                          name: contactList[index].name, 
                          phone: contactList[index].phone, 
                          email: contactList[index].email, 
                          company: contactList[index].company, 
                          job: contactList[index].job),
                      )
                  .then((_) => print("Berhasil menambah favorit"))
                  .catchError((_) => print("Error Tambah Favorit"));
                    },
                    child: Image.asset("assets/icons/more1.png"),
                    ),
                    ),
          );
        },
      ),
    );
  }
}
