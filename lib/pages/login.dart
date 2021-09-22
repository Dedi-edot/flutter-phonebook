import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:kontak/pages/home_page.dart';
import 'package:kontak/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const nameRoute = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerPassword;
  bool see = false;

  Future<void> login(String email, String password) async {
    Map<String, dynamic> map = {
      "email": email,
      "password": password
    };
String rawJson = jsonEncode(map);
    print(rawJson);
    String url = "https://phone-book-api.herokuapp.com/api/v1/signin";
    Response response;
    var dio = Dio();
    response = await dio.post(url,
        data: rawJson);
    print(response.data);
  }

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff05466A),
        appBar: AppBar(
          backgroundColor: Color(0xff05466A),
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RegisterPage.nameRoute);
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 27,
            ),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/img/logo_contact1.png",
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _controllerEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xff1D3E53),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _controllerPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: see,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xff1D3E53),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  see = !see;
                                });
                              },
                              child: see
                                  ? Icon(Icons.lock_outline)
                                  : Icon(Icons.lock_open_rounded))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffE94560)),
                        onPressed: () {
                          print(_controllerEmail.text);
                          if (_formKey.currentState!.validate()) {
                            login(_controllerEmail.text,
                                _controllerPassword.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                          // Navigator.of(context)
                          //     .pushReplacementNamed(HomePage.nameRoute);
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
