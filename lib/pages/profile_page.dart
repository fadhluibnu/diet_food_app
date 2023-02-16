import 'dart:convert';
import 'dart:ffi';

import 'package:diet_food_app/http_handler/user.dart';
import 'package:diet_food_app/login_page.dart';
import 'package:diet_food_app/pages/settings/change_password/input_emal_userid.dart';
import 'package:diet_food_app/pages/settings/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const IconData iconedit =
      IconData(0xe800, fontFamily: "icon_edit", fontPackage: null);
  static const IconData iconhelp =
      IconData(0xe803, fontFamily: "icon_help", fontPackage: null);
  static const IconData iconlanguage =
      IconData(0xe804, fontFamily: "icon_language", fontPackage: null);
  static const IconData iconlogout =
      IconData(0xe805, fontFamily: "icon_logout", fontPackage: null);
  static const IconData iconreward =
      IconData(0xe801, fontFamily: "icon_reward", fontPackage: null);
  static const IconData iconpassword =
      IconData(0xe806, fontFamily: "icon_password", fontPackage: null);

  static bool alert = false;


  String myToken = "";
  String logoutAlert = "nodefine";
  String name = "";
  String username = "";
  void initState() {
    super.initState();
    getToken();
    getName();
  }

  void getToken() async {
    SharedPreferences token = await SharedPreferences.getInstance();
    setState(() {
      myToken = token.getString("token") ?? "false";
    });
    print(myToken);
  }


  void getName() async {
    SharedPreferences namePref = await SharedPreferences.getInstance();
    setState(() {
      name = namePref.getString("name") ?? "";
      username = namePref.getString("username") ?? "";
    });
  }

  logout(token) async {
    try {
      var res = await UserController().logout(token, '/logout');
      var body = jsonDecode(res.body);
      if (body['message'] == "Logged out") {
        setState(() {
          logoutAlert = "berhasil";
        });
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.remove("token");
        pref.remove("login");
        pref.remove("name");
        pref.remove("username");
        pref.remove("email");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
        // Navigator.pop(context);
      } else {
        print("gagal logout");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(name,
              style: TextStyle(
                  fontFamily: "poppins_medium",
                  fontSize: 20,
                  color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(username,
              style: TextStyle(
                  fontFamily: "poppins_regular",
                  fontSize: 14,
                  color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditProfile();
              }));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 14, 12, 14),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 141, 141, 141)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(iconedit),
                      Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text("Edit Profile",
                              style: TextStyle(
                                  fontFamily: "poppins_regular", fontSize: 16)))
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InputEmailUserid();
              }));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 14, 12, 14),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 141, 141, 141)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(iconpassword),
                      Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text("Change Password",
                              style: TextStyle(
                                  fontFamily: "poppins_regular", fontSize: 16)))
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: EdgeInsets.fromLTRB(12, 14, 12, 14),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 141, 141, 141)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(iconreward),
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text("Rewards",
                            style: TextStyle(
                                fontFamily: "poppins_regular", fontSize: 16)))
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 15)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: EdgeInsets.fromLTRB(12, 14, 12, 14),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 141, 141, 141)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(iconhelp),
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text("Help Center",
                            style: TextStyle(
                                fontFamily: "poppins_regular", fontSize: 16)))
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 15)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: EdgeInsets.fromLTRB(12, 14, 12, 14),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 141, 141, 141)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(iconlanguage),
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text("Language",
                            style: TextStyle(
                                fontFamily: "poppins_regular", fontSize: 16)))
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 15)
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: AlertLogout,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 14, 12, 14),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 255, 130, 130)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(iconlogout, color: Color.fromARGB(255, 246, 48, 41)),
                      Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text("Logout",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 246, 48, 41),
                                  fontFamily: "poppins_regular",
                                  fontSize: 16)))
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: Color.fromARGB(255, 246, 48, 41))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  AlertLogout() {
    print(logoutAlert);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Color.fromARGB(255, 229, 229, 229),
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              content: Container(
                  width: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      logoutAlert == "berhasil" ?
                      Container(
                        padding: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: 
                            Text(
                              "Berhasil Keluar",
                              style: TextStyle(
                                  fontFamily: "poppins_semibold", fontSize: 16),
                            ),
                        ),
                      )
                      :
                      Container(
                        padding: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Text(
                              "Logout",
                              style: TextStyle(
                                  fontFamily: "poppins_semibold", fontSize: 16),
                            ),
                            Text(
                              "Sure you want to logout?",
                              style: TextStyle(
                                  fontFamily: "poppins_regular", fontSize: 14),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.black12))),
                      ),
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1, color: Colors.black12))),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No",
                                          style: TextStyle(
                                              fontFamily: "poppins_regular",
                                              fontSize: 16,
                                              color: Colors.red)),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Color.fromARGB(255, 229, 229, 229),
                                          ),
                                          elevation:
                                              MaterialStateProperty.all(0))),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    onPressed: () {
                                      logout(myToken);
                                      Navigator.pop(context);
                                    },
                                    child: Text("Yes",
                                        style: TextStyle(
                                            fontFamily: "poppins_regular",
                                            fontSize: 16,
                                            color: Colors.blue)),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color.fromARGB(255, 229, 229, 229),
                                        ),
                                        elevation:
                                            MaterialStateProperty.all(0))),
                              ))
                        ],
                      )
                    ],
                  )));
        });
  }
}
