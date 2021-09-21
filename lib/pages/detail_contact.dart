import 'package:flutter/material.dart';

class DetailContact extends StatelessWidget {
  const DetailContact({Key? key}) : super(key: key);
  static const nameRoute = "/detail_contact";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCDCDC),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Row(
                      children: [
                        Image.asset("assets/icons/Vector3.png"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
              child: Column(
              children: [
                Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(20),
                      ),
                    child: Icon(Icons.person,
                    size: 150,),
                  ),
                SizedBox(height: 30,),
                Text("Michael Balack", 
                  style: TextStyle(fontSize: 24)
                  ),
                  SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      Row(
                        children: [
                        Icon(Icons.phone, size: 30,),
                        SizedBox(width: 20,),
                        Text("085711170818", style: TextStyle(fontSize: 20),)
                      ],),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                        Icon(Icons.account_balance, size: 30,),
                        SizedBox(width: 20,),
                        Text("Refactory", style: TextStyle(fontSize: 20),)
                      ],),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                        Icon(Icons.build, size: 30,),
                        SizedBox(width: 20,),
                        Text("Engineer", style: TextStyle(fontSize: 20),)
                      ],),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                        Icon(Icons.mail_outline, size: 30,),
                        SizedBox(width: 20,),
                        Text("hahay@email.com", style: TextStyle(fontSize: 20),)
                      ],),
                    ],
                  ),
                )
              ],
              ),
            ),
              ),
            ],
          ),
        ));
  }
}
