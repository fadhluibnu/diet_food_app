import 'dart:convert';
import 'dart:ffi';

import 'package:diet_food_app/http_handler/user.dart';
import 'package:diet_food_app/template/pages_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // icon
  static const IconData email_icon =
      IconData(0xe800, fontFamily: "email_icon", fontPackage: null);
  static const IconData lock_icon =
      IconData(0xe801, fontFamily: "lock_icon", fontPackage: null);

  TextEditingController name_controller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();

  String loading = "noaction";
  String name = "true";
  String username = "true";
  String email = "true";
  String password = "true";
  String conf_password = "true";

  void confirmPassword() {
    if (confirm_password_controller.text != password_controller.text) {
      setState(() {
        loading = "confirmPass";
        conf_password = "false";
      });
    } else {
      setState(() {
        conf_password = "true";
        loading = "noaction";
      });
    }
  }

  void passwordValidate() {
    var array = password_controller.text;
    if (array.length >= 6) {
      setState(() {
        loading = "noaction";
        password = "true";
      });
    } else {
      setState(() {
        loading = "min6";
        password = "false";
      });
    }
  }

  register() async {
    setState(() {
      loading = "pressed";
    });
    if (name_controller.text == '') {
      setState(() {
        name = "null";
      });
    } else {
      setState(() {
        name = "true";
      });
    }
    if (username_controller.text == '') {
      setState(() {
        username = "null";
      });
    } else {
      setState(() {
        username = "true";
      });
    }
    if (email_controller.text == '') {
      setState(() {
        email = "null";
      });
    } else {
      setState(() {
        email = "true";
      });
    }
    if (name_controller.text == '' ||
        username_controller.text == '' ||
        email_controller.text == '' ||
        password == "false" ||
        conf_password == "false") {
      return "false";
    }
    try {
      var data = {
        "name": name_controller.text,
        "username": username_controller.text,
        "email": email_controller.text,
        "password": password_controller.text,
      };
      var res = await UserController().register(data, '/register');
      var body = jsonDecode(res.body);
      print(body['errors']);

      if (body['message'] != 'berhasil') {
        final error = {};
        var objectError = body['errors'];
        for (var key in objectError.keys) {
          error.addAll({'$key': '${objectError[key]}'});
        }
        if (error.containsKey('username')) {
          setState(() {
            username = "false";
          });
        }
        if (error.containsKey('email')) {
          setState(() {
            email = "false";
          });
        }
        setState(() {
          loading = "fail";
        });
      } else {
        setState(() {
          loading = "success";
        });
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("token", body['token']);
        preferences.setString("name", body['user']['name']);
        preferences.setString("email", body['user']['email']);
        preferences.setString("username", body['user']['username']);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return PagesTemplate();
        }));
      }
    } catch (e) {
      print(e);
      setState(() {
        loading = "fail";
      });
      return "false";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 235, 239, 243),
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
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
                                  color: loading == "name" ||
                                          loading == "failed" ||
                                          name == "null"
                                      ? Color.fromARGB(255, 248, 70, 70)
                                      : Color.fromARGB(255, 141, 141, 141))),
                          padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                          child: TextField(
                            controller: name_controller,
                            cursorColor: Color.fromARGB(255, 82, 82, 82),
                            onChanged: (value) {},
                            style: TextStyle(
                                fontFamily: "poppins_regular",
                                color: Color.fromARGB(255, 82, 82, 82)),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.account_circle_rounded,
                                color: Color.fromARGB(255, 82, 82, 82),
                                size: 20,
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              hintText: "Name",
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
                      name == "null"
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                "Username tidak boleh kosong",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 70, 70),
                                    fontFamily: "poppins_regular"),
                              ),
                            )
                          : loading == "name" ||
                                  loading == "failed" ||
                                  name == "invalid"
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    "Invalid username",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 248, 70, 70),
                                        fontFamily: "poppins_regular"),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: loading == "username" ||
                                        loading == "emailandpass" ||
                                        loading == "failed" ||
                                        username == "false" ||
                                        username == "null"
                                    ? Color.fromARGB(255, 248, 70, 70)
                                    : Color.fromARGB(255, 141, 141, 141))),
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        child: TextField(
                          controller: username_controller,
                          cursorColor: Color.fromARGB(255, 82, 82, 82),
                          onChanged: (value) {},
                          style: TextStyle(
                              fontFamily: "poppins_regular",
                              color: Color.fromARGB(255, 82, 82, 82)),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            icon: Icon(
                              Icons.account_circle_rounded,
                              color: Color.fromARGB(255, 82, 82, 82),
                              size: 20,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            hintText: "Username",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                          ),
                        ),
                      ),
                      username == "null"
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                "Username tidak boleh kosong",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 70, 70),
                                    fontFamily: "poppins_regular"),
                              ),
                            )
                          : username == "false"
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    "username tidak tersedia",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 248, 70, 70),
                                        fontFamily: "poppins_regular"),
                                  ),
                                )
                              : loading == "username" || loading == "failed"
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: Text(
                                        "Invalid username",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 248, 70, 70),
                                            fontFamily: "poppins_regular"),
                                      ),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                    ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: loading == "email" ||
                                        loading == "emailandpass" ||
                                        loading == "failed" ||
                                        email == "false" ||
                                        email == "null"
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
                              size: 16,
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
                      email == "null"
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                "Email tidak boleh kosong",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 70, 70),
                                    fontFamily: "poppins_regular"),
                              ),
                            )
                          : email == "false"
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    "Email tidak ditemukan",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 248, 70, 70),
                                        fontFamily: "poppins_regular"),
                                  ),
                                )
                              : loading == "email" ||
                                      loading == "emailandpass" ||
                                      loading == "failed"
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: Text(
                                        "Invalid Email",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 248, 70, 70),
                                            fontFamily: "poppins_regular"),
                                      ),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                    ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: loading == "password" ||
                                        loading == "emailandpass" ||
                                        loading == "failed" ||
                                        loading == "min6"
                                    ? Color.fromARGB(255, 248, 70, 70)
                                    : Color.fromARGB(255, 141, 141, 141))),
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        child: TextField(
                          controller: password_controller,
                          cursorColor: Color.fromARGB(255, 82, 82, 82),
                          onChanged: (value) {
                            passwordValidate();
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
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                "Invalid Password",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 70, 70),
                                    fontFamily: "poppins_regular"),
                              ))
                          : loading == "min6"
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    "Length must be 6 characters",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 248, 70, 70),
                                        fontFamily: "poppins_regular"),
                                  ))
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: loading == "confirmPass" ||
                                        loading == "password" ||
                                        loading == "failed"
                                    ? Color.fromARGB(255, 248, 70, 70)
                                    : Color.fromARGB(255, 141, 141, 141))),
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        child: TextField(
                          controller: confirm_password_controller,
                          cursorColor: Color.fromARGB(255, 82, 82, 82),
                          onChanged: (value) {
                            confirmPassword();
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
                            hintText: "Confirm Your Password",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0)),
                          ),
                        ),
                      ),
                      loading == "confirmPass" ||
                              loading == "password" ||
                              loading == "failed"
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 16),
                              child: Text(
                                "Invalid Password",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 70, 70),
                                    fontFamily: "poppins_regular"),
                              ))
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 16),
                            ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              register();
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 82, 82, 82),
                                  fontFamily: "poppins_regular",
                                  fontSize: 14),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 62, 109, 156),
                                      fontFamily: "poppins_regular",
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
