import 'package:flutter/material.dart';
import 'package:kontak/pages/home_page.dart';
import 'package:kontak/pages/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const nameRoute = "/login";

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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xff1D3E53),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.white,),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xff1D3E53),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.white,),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color(0xffE94560)),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.nameRoute);
                      },
                      child: Text("LOGIN", style: TextStyle(fontSize: 20),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
