import 'dart:convert';

import 'package:diet_food_app/http_handler/user.dart';
import 'package:diet_food_app/pages/settings/change_password/change_password.dart';
import 'package:flutter/material.dart';

class OtpConfirmation extends StatefulWidget {
  const OtpConfirmation({Key? key}) : super(key: key);

  @override
  _OtpConfirmationState createState() => _OtpConfirmationState();
}

class _OtpConfirmationState extends State<OtpConfirmation> {
  TextEditingController _fieldOne = TextEditingController();
  TextEditingController _fieldTwo = TextEditingController();
  TextEditingController _fieldThree = TextEditingController();
  TextEditingController _fieldFour = TextEditingController();
  TextEditingController _fieldFive = TextEditingController();
  TextEditingController _fieldSix = TextEditingController();

  String loading = "noaction";

  otpVerif(one, two, three, four, five, six) async {
    setState(() {
      loading = "pressed";
    });
    if (one != '' &&
        two != '' &&
        three != '' &&
        four != '' &&
        five != '' &&
        six != '') {
      String otp = one + two + three + four + five + six;
      try {
        var data = {'otp': otp};
        var res = await UserController().otpVerif(data, "/otp-validation");
        var body = jsonDecode(res.body);
        if (body['code'] == 200) {
          setState(() {
            loading = "success";
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChangePassword();
          }));
        } else {
          setState(() {
            loading = "invalidcode";
          });
        }
      } catch (e) {
        print(4);
        setState(() {
          loading = "fail";
        });
      }
    } else {
      setState(() {
        loading = "missing";
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 8, top: 20),
                        child: Text("Enter the 6 digit code",
                            style: TextStyle(
                                fontSize: 20, fontFamily: "poppins_regular"))),
                    Text(
                      "To change your password, enter the 6-digit code sent via email h****@gmail.com",
                      style: TextStyle(
                          fontSize: 14, fontFamily: "poppins_regular"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32, bottom: 32),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OtpInput(
                                  _fieldOne,
                                  loading,
                                  true,
                                ),
                                OtpInput(
                                  _fieldTwo,
                                  loading,
                                  false,
                                ),
                                OtpInput(
                                  _fieldThree,
                                  loading,
                                  false,
                                ),
                                OtpInput(
                                  _fieldFour,
                                  loading,
                                  false,
                                ),
                                OtpInput(
                                  _fieldFive,
                                  loading,
                                  false,
                                ),
                                OtpInput(
                                  _fieldSix,
                                  loading,
                                  false,
                                ),
                              ],
                            ),
                          ),
                          loading == "invalidcode"
                              ? Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    "Invalid Code",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 248, 70, 70),
                                        fontFamily: "poppins_regular"),
                                  ),
                              )
                              : Container(
                                  width: 0,
                                  height: 0,
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              children: [
                                Text(
                                  "Resend code",
                                  style: TextStyle(
                                      fontFamily: "poppins_regular",
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 141, 141, 141)),
                                ),
                                Text(
                                  "12s",
                                  style: TextStyle(
                                    fontFamily: "poppins_regular",
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            otpVerif(
                                _fieldOne.text,
                                _fieldTwo.text,
                                _fieldThree.text,
                                _fieldFour.text,
                                _fieldFive.text,
                                _fieldSix.text);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 62, 109, 156)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          child: Padding(
                            padding: EdgeInsets.all(15),
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
                                "Next",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: "poppins_medium",
                                ),
                              ),
                          )),
                    ),
                  ]))),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final String loading;
  const OtpInput(
    this.controller,
    this.loading,
    this.autoFocus, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 56,
      child: TextField(
        autofocus: autoFocus,
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: Color.fromARGB(255, 82, 82, 82),
        style: TextStyle(
          fontFamily: "poppins_regular",
          color: Color.fromARGB(255, 82, 82, 82),
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: loading == "invalidcode"
                      ? Color.fromARGB(255, 248, 70, 70)
                      : Color.fromARGB(255, 141, 141, 141),
                  width: 0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: loading == "invalidcode"
                      ? Color.fromARGB(255, 248, 70, 70)
                      : Color.fromARGB(255, 141, 141, 141),
                  width: 0)),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
