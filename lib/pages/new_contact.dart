import 'package:flutter/material.dart';

class NewContact extends StatelessWidget {
  const NewContact({Key? key}) : super(key: key);
  static const nameRoute = "/new_contacts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDCDCDC),
        body: SingleChildScrollView(
          child: SafeArea(
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
                  padding: EdgeInsets.all(30),
                  child: Center(
                      child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 150,
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xffC4C4C4),
                          filled: true,
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xffC4C4C4),
                                filled: true,
                                hintText: "Phone",
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xffC4C4C4),
                                filled: true,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xffC4C4C4),
                                filled: true,
                                hintText: "Company",
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(
                                  Icons.account_balance_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xffC4C4C4),
                                filled: true,
                                hintText: "Job",
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(
                                  Icons.build,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffE94560)),
                          onPressed: () {},
                          child: Text(
                            "CREATE NEW ACCOUNT",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
