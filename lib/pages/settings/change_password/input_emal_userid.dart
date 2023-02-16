import 'dart:convert';

import 'package:diet_food_app/http_handler/user.dart';
import 'package:diet_food_app/pages/settings/change_password/otp_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputEmailUserid extends StatefulWidget {
  const InputEmailUserid({Key? key}) : super(key: key);

  @override
  _InputEmailUseridState createState() => _InputEmailUseridState();
}

class _InputEmailUseridState extends State<InputEmailUserid> {
  void initState() {
    super.initState();
    getName();
  }

  String email = "";
  String username = "";

  TextEditingController email_address = TextEditingController();
  TextEditingController user_id = TextEditingController();

  void getName() async {
    SharedPreferences namePref = await SharedPreferences.getInstance();
    setState(() {
      email_address.text = namePref.getString("email") ?? "";
      user_id.text = namePref.getString("username") ?? "";
    });
  }

  String loading = "noaction";

  getOtp(username, email) async {
    setState(() {
      loading = "pressed";
    });
    try {
      var data = {"email": email, "username": username};
      var res = await UserController().getOtp(data, '/forgot-password');
      var body = jsonDecode(res.body);
      if (body['status'] == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return OtpConfirmation();
        }));
        setState(() {
          loading = "success";
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        loading = "fail";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              backgroundColor: Color.fromARGB(255, 62, 109, 156),
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 10),
                    //  padding: EdgeInsets.fromLTRB(10, 10, 10, 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white, size: 16)),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text("Change Password",
                                  style: TextStyle(
                                      fontFamily: "poppins_regular",
                                      fontSize: 20,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 8, top: 20),
                    child: Text(
                        "Please complete the data below to change the password",
                        style: TextStyle(
                            fontSize: 20, fontFamily: "poppins_regular"))),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(fontSize: 14, fontFamily: "poppins_regular"),
                ),

                // email_addres
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 32),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email Address",
                          style: TextStyle(
                              fontSize: 16, fontFamily: 'poppins_regular'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                      controller: email_address,
                      cursorColor: Color.fromARGB(255, 82, 82, 82),
                      style: TextStyle(
                        fontFamily: "poppins_regular",
                        color: Color.fromARGB(255, 82, 82, 82),
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color.fromARGB(244, 141, 141, 141),
                                width: 0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color.fromARGB(244, 141, 141, 141),
                                width: 0)),
                      )),
                ),

                // email_addres
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("User Id",
                          style: TextStyle(
                              fontSize: 16, fontFamily: 'poppins_regular'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                      controller: user_id,
                      cursorColor: Color.fromARGB(255, 82, 82, 82),
                      style: TextStyle(
                        fontFamily: "poppins_regular",
                        color: Color.fromARGB(255, 82, 82, 82),
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color.fromARGB(244, 141, 141, 141),
                                width: 0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Color.fromARGB(244, 141, 141, 141),
                                width: 0)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          getOtp(user_id.text, email_address.text);
                        },
                        style: ButtonStyle(
                            backgroundColor: loading == "pressed"
                            ? MaterialStateProperty.all(
                                Color.fromARGB(255, 94, 143, 192))
                            : MaterialStateProperty.all(
                                Color.fromARGB(255, 62, 109, 156)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)))),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: 
                          loading == 'pressed' ?
                          Text(
                            "Loading...",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: "poppins_medium",
                            ),
                          ) : Text(
                            "Next",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: "poppins_medium",
                            ),
                          ) 
                        )),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
