// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kontak/db/db_helper.dart';
import 'package:kontak/models/fav_model.dart';
// import 'package:kontak/models/response_get_allcontact.dart';
import 'package:kontak/providers/all_contacts.dart';
import 'package:provider/provider.dart';
import 'package:kontak/pages/detail_contact.dart';
import 'package:kontak/pages/new_contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyContacts extends StatefulWidget {
  const MyContacts({Key? key}) : super(key: key);
  static const nameRoute = "/my_contacts";

  @override
  _MyContactsState createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  bool isInit = true;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future getContact() async {
    final SharedPreferences prefs = await _prefs;
    final token = prefs.getString('token') ?? "0";

    print("Bearer $token");

    if (token != "0") {
      Provider.of<Contacts>(context, listen: false).initialData(token);
    }
  }

  @override
  void initState() {
    super.initState();
    getContact();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      print("Sukses");
      getContact();
    }
    isInit = false;
    super.didChangeDependencies();
  }

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
                  imageUrl: contactList[index].image != null
                      ? contactList[index].image
                      : "https://cdn.icon-icons.com/icons2/1674/PNG/512/person_110935.png",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              title: Text(contactList[index].name),
              subtitle: Text(contactList[index].phone),
              trailing: GestureDetector(
                onTap: () async {
                  await DatabaseHelper.instance
                      .add(
                    FavModel(
                        name: contactList[index].name,
                        phone: contactList[index].phone,
                        email: contactList[index].email,
                        company: contactList[index].company.toString(),
                        job: contactList[index].job,
                        image: contactList[index].image != null
                            ? contactList[index].image
                            : "https://cdn.icon-icons.com/icons2/1674/PNG/512/person_110935.png"),
                  )
                      .then((_) {
                    contactData.changeIsFav(contactList[index].phone, true);
                    print("Berhasil menambah favorit");
                  });
                  // .catchError((_) => print("Error Tambah Favorit"));
                },
                child: contactList[index].isFav
                    ? Icon(
                        Icons.grade_sharp,
                        color: Colors.amber,
                      )
                    : Icon(Icons.grade_outlined),
              ),
            ),
          );
        },
      ),
    );
  }
}
