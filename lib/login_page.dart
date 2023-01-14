import 'dart:ffi';

import 'package:diet_food_app/template/pages_template.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode myFocusNode;
  void setSharedPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("login", true);
  }

  // input controller
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  // icon
  static const IconData email_icon =
      IconData(0xe800, fontFamily: "email_icon", fontPackage: null);
  static const IconData lock_icon =
      IconData(0xe801, fontFamily: "lock_icon", fontPackage: null);

  // @override
  // void initState() {
  //   super.initState();

  //   myFocusNode = FocusNode();
  // }

  // @override
  // void dispose() {
  //   myFocusNode.dispose();

  //   super.dispose();
  // }
  bool value_checkbox = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        color: Color.fromARGB(255, 235, 239, 243),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 47, 16, 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 24,
                    child: Image(
                      image: AssetImage("assets/images/logo_app.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8),
                    child: Text(
                      "My Diet",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "poppins_medium",
                          fontSize: 20),
                    ),
                  )
                ],
              ),
              Text(
                "Welcome back!!",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "poppins_medium",
                    fontSize: 24),
              ),
              Text(
                "let's continue your progress",
                style: TextStyle(
                    color: Color.fromARGB(255, 82, 82, 82),
                    fontFamily: "poppins_regular",
                    fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromARGB(255, 141, 141, 141))),
                  padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                  child: TextField(
                    controller: email_controller,
                    cursorColor: Color.fromARGB(255, 82, 82, 82),
                    onChanged: (value) {},
                    style: TextStyle(
                        fontFamily: "poppins_regular",
                        color: Color.fromARGB(255, 82, 82, 82)),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      icon: Icon(
                        email_icon,
                        color: Color.fromARGB(255, 82, 82, 82),
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Color.fromARGB(255, 141, 141, 141))),
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: TextField(
                  controller: password_controller,
                  cursorColor: Color.fromARGB(255, 82, 82, 82),
                  // focusNode: myFocusNode,
                  onChanged: (value) {},
                  style: TextStyle(
                      fontFamily: "poppins_regular",
                      color: Color.fromARGB(255, 82, 82, 82)),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    icon: Icon(
                      lock_icon,
                      color: Color.fromARGB(255, 82, 82, 82),
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    hintText: "password",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (value_checkbox) {
                            value_checkbox = false;
                          } else {
                            value_checkbox = true;
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            value_checkbox
                                ? Icons.check_box_rounded
                                : Icons.check_box_outline_blank_rounded,
                            color: value_checkbox
                                ? Color.fromARGB(255, 62, 109, 156)
                                : Color.fromARGB(255, 82, 82, 82),
                            size: 30,
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(
                                fontFamily: 'poppins_regular',
                                fontSize: 14,
                                color: Color.fromARGB(255, 82, 82, 82)),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontFamily: 'poppins_regular',
                          fontSize: 14,
                          color: Colors.red),
                    )
                  ],
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return PagesTemplate();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: "poppins_medium",
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 62, 109, 156)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)))),
                  ))
            ],
          ),
        ),
      )
          // body: ,
          ),
    );
  }
}
