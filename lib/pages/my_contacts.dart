import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kontak/db/db_helper.dart';
import 'package:kontak/models/contact.dart';
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
  List<GetContact> favorite = [];
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controllerSearch;

  Future getContact() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final token = prefs.getString('token') ?? "0";

    if (token != "0") {
      Provider.of<Contacts>(context, listen: false).initialData(token);
    } else {
      print("Bearer $token");
    }
  }

  @override
  void initState() {
    super.initState();
    _controllerSearch = TextEditingController();
    getContact();
  }

  @override
  Widget build(BuildContext context) {
    final contactData = Provider.of<Contacts>(context);
    final contactList = contactData.contactList;
    List<GetContact> filteredContact = contactList;
    DatabaseHelper.instance
        .getFavContact()
        .then((value) => value.forEach((element) {
              favorite.add(element);
            }));

    bool isFav(int id) {
      bool fav = false;
      favorite.forEach((element) {
        if (element.id == contactList[id].id) {
          fav = true;
        }
      });
      return fav;
    }

    // search(String val) {
    //   if (val.length > 0) {
    //     filteredContact = contactList.where((contact) =>
    //             contact.name!.contains(val) || contact.phone!.contains(val));
    //   }
    // }

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
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controllerSearch,
                    onChanged: (value) {
                      // search(value);
                      print(filteredContact);
                    },
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
            ),
          )),
      body: ListView.separated(
        itemCount: filteredContact.length,
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
                    arguments: filteredContact[index].phone);
              },
              leading: Container(
                decoration: BoxDecoration(
                    color: Color(0xffC4C4C4),
                    borderRadius: BorderRadius.circular(20)),
                child: CachedNetworkImage(
                  width: 40,
                  imageUrl: filteredContact[index].image != null
                      ? filteredContact[index].image.toString()
                      : "https://cdn.icon-icons.com/icons2/1674/PNG/512/person_110935.png",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              title: Text(filteredContact[index].name.toString()),
              subtitle: Text(filteredContact[index].phone.toString()),
              trailing: GestureDetector(
                onTap: () async {
                  await DatabaseHelper.instance
                      .add(GetContact(
                    id: filteredContact[index].id,
                    name: filteredContact[index].name,
                    phone: filteredContact[index].phone,
                    email: filteredContact[index].email,
                    company: filteredContact[index].company,
                    job: filteredContact[index].job,
                    image: filteredContact[index].image,
                  ))
                      .then((_) {
                    setState(() {
                      getContact();
                    });
                    print("Berhasil menambah favorit");
                  });
                },
                child: isFav(index)
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
