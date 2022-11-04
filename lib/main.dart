import 'package:diet_food_app/login_page.dart';
import 'package:diet_food_app/template/pages_template.dart';
import 'package:diet_food_app/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool welcome_page = false;
  bool login_page = false;

  void toRedirect() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.remove("welcome");
    setState(() {
      welcome_page = (pref.getBool("welcome") ?? false);
      login_page = (pref.getBool("login") ?? false);
    });
  }

  void initState() {
    super.initState();
    toRedirect();
  }

  @override
  Widget build(BuildContext context) {
    var inisialisasi;
    if (welcome_page != false && login_page != false) {
      inisialisasi = PagesTemplate();
    } else if (welcome_page != false) {
      inisialisasi = LoginPage();
    } else if (welcome_page == false) {
      inisialisasi = WelcomeOne();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: inisialisasi,
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }

