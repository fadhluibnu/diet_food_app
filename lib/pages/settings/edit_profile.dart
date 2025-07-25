import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController user_id = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone_number = TextEditingController();

  // String nameDisplay = "";
  // String username = "";
  // String emailDisplay = "";
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name.text = pref.getString("name") ?? "";
      user_id.text = pref.getString("username") ?? "";
      email.text = pref.getString("email") ?? "";
    });
  }

  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
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
                          child: Text("Edit Profile",
                              style: TextStyle(
                                  fontFamily: "poppins_regular",
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            // width: 57,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white12),
                            child: Text("Done",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white))),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: GestureDetector(
                  onTap: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    print(image!.path);
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(50)),
                    child: image == null
                        ? Container()
                        : Image.file(File(image!.path)),
                  ),
                ),
              ),

              // NAME
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Name",
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'poppins_regular'))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                    controller: name,
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

              // User Id
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

              // email
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email",
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'poppins_regular'))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                    controller: email,
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

              // phone
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Phone Number",
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'poppins_regular'))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                    controller: phone_number,
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
            ],
          ),
        ),
      ),
    ));
  }
}
