import 'dart:convert';
import 'dart:ffi';

import 'package:diet_food_app/http_handler/user.dart';
import 'package:diet_food_app/template/pages_template.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode myFocusNode;
  bool value_checkbox = false;
  String loading = "no-action";

  // input controller
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  void setSharedPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("login", true);
  }

  void setLoading(action) {
    setState(() {
      loading = action;
    });
  }

  loginAuth(email, password) async {
    setLoading('pressed');
    print("pressed");
    if (email_controller.text == '' && password_controller.text == '') {
      setLoading("emailandpass");
      print("emailpass");
    } else if (email_controller.text == '') {
      setLoading('email');
      print("email");
    } else if (password_controller.text == '') {
      setLoading('password');
    } else {
      var data = {'email': email, 'password': password};
      var res = await UserController().login(data, '/login');
      var body = jsonDecode(res.body);
      if (body['status'] == 200) {
        if (value_checkbox == true) {
          setSharedPref();
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString("token", body['token']);
          preferences.setString("name", body['user']['name']);
          preferences.setString("email", body['user']['email']);
          preferences.setString("username", body['user']['username']);
        }
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return PagesTemplate();
        }));
        setLoading('success');
      } else {
        setLoading("failed");
      }
    }
  }

  // icon
  static const IconData email_icon =
      IconData(0xe800, fontFamily: "email_icon", fontPackage: null);
  static const IconData lock_icon =
      IconData(0xe801, fontFamily: "lock_icon", fontPackage: null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
                child: Container(
          // height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 235, 239, 243),
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 47, 16, 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: loading == "email" ||
                                        loading == "emailandpass" ||
                                        loading == "failed"
                                    ? Color.fromARGB(255, 248, 70, 70)
                                    : Color.fromARGB(255, 141, 141, 141))),
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
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                          ),
                        ),
                      ),
                    ),
                    loading == "email" ||
                            loading == "emailandpass" ||
                            loading == "failed"
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              "Invalid Email",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 248, 70, 70),
                                  fontFamily: "poppins_regular"),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                          ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: loading == "password" ||
                                      loading == "emailandpass" ||
                                      loading == "failed"
                                  ? Color.fromARGB(255, 248, 70, 70)
                                  : Color.fromARGB(255, 141, 141, 141))),
                      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: TextField(
                        controller: password_controller,
                        cursorColor: Color.fromARGB(255, 82, 82, 82),
                        // focusNode: myFocusNode,
                        onChanged: (value) {
                          // setState(() {
                          //   password_controller.text = value;
                          // });
                        },
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
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0)),
                        ),
                      ),
                    ),
                    loading == "password" ||
                            loading == "emailandpass" ||
                            loading == "failed"
                        ? Text(
                            "Invalid Password",
                            style: TextStyle(
                                color: Color.fromARGB(255, 248, 70, 70),
                                fontFamily: "poppins_regular"),
                          )
                        : Container(
                            width: 0,
                            height: 0,
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
                            loginAuth(email_controller.text,
                                password_controller.text);
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: loading == "pressed"
                                  ? Text(
                                      "Loading ...",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: "poppins_medium",
                                      ),
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: "poppins_medium",
                                      ),
                                    )),
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: loading == "pressed"
                                  ? MaterialStateProperty.all(
                                      Color.fromARGB(255, 94, 143, 192))
                                  : MaterialStateProperty.all(
                                      Color.fromARGB(255, 62, 109, 156)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                        )),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account yet?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 82, 82, 82),
                              fontFamily: "poppins_regular",
                              fontSize: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterPage();
                              }));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 62, 109, 156),
                                  fontFamily: "poppins_regular",
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
                ),
              )
          // body: ,
          ),
    );
  }
}
