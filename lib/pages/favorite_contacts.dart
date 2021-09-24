import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kontak/db/db_helper.dart';
import 'package:kontak/models/contact.dart';
import 'package:kontak/pages/detail_contact.dart';

class FavoriteContacts extends StatefulWidget {
  const FavoriteContacts({Key? key}) : super(key: key);
  static const nameRoute = "/favorite_contacts";

  @override
  _FavoriteContactsState createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {
  @override
  Widget build(BuildContext context) {
    // final contactData = Provider.of<Contacts>(context);
    
    return Scaffold(
      backgroundColor: Color(0xffDCDCDC),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffDCDCDC),
          title: Text(
            "Favorites",
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
      body: FutureBuilder<List<GetContact>>(
          future: DatabaseHelper.instance.getFavContact(),
          builder:
              (BuildContext context, AsyncSnapshot<List<GetContact>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return snapshot.data!.isEmpty
                ? Center(child: Text("You don't have any favorite contact yet"))
                : ListView(
                    children: snapshot.data!.map((fav) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListTile(
                          onLongPress: () {
                            Navigator.of(context).pushNamed(
                                DetailContact.nameRoute,
                                arguments: fav.phone);
                          },
                          leading: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffC4C4C4),
                                borderRadius: BorderRadius.circular(20)),
                            child: CachedNetworkImage(
                              width: 40,
                              imageUrl: fav.image.toString(),
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                          title: Text(fav.name.toString()),
                          subtitle: Text(fav.phone.toString()),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                DatabaseHelper.instance.remove(fav.id!);
                              });
                              // contactData.changeIsFav(fav.phone, false);
                              print("berhasil dihapus dari favorit");
                            },
                            child: Icon(Icons.delete),
                          ),
                        ),
                      );
                    }).toList(),
                  );
          }),
    );
  }
}
