import 'package:diet_food_app/login_page.dart';
import 'package:diet_food_app/pages/settings/edit_profile.dart';
import 'package:flutter/material.dart';

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
    static const IconData iconpassword = IconData(0xe806, fontFamily: "icon_password", fontPackage: null);


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
          child: Text("Habib Rafi’i",
              style: TextStyle(
                  fontFamily: "poppins-medium",
                  fontSize: 20,
                  color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text("lorem",
              style: TextStyle(
                  fontFamily: "poppins-reguler",
                  fontSize: 14,
                  color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
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
                                  fontFamily: "poppins-reguler", fontSize: 16)))
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
                    Icon(iconpassword),
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text("Change Password",
                            style: TextStyle(
                                fontFamily: "poppins-reguler", fontSize: 16)))
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
                    Icon(iconreward),
                    Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text("Rewards",
                            style: TextStyle(
                                fontFamily: "poppins-reguler", fontSize: 16)))
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
                                fontFamily: "poppins-reguler", fontSize: 16)))
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
                                fontFamily: "poppins-reguler", fontSize: 16)))
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 15)
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          },
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
                                  fontFamily: "poppins-reguler",
                                  fontSize: 16)))
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color.fromARGB(255, 246, 48, 41))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
