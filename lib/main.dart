import 'dart:async';
import 'dart:convert';

import 'package:diet_food_app/login_page.dart';
import 'package:diet_food_app/pages/home_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hearth = false;
  String plus_scale = "hidden";
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        hearth = true;
      });
    });
    Timer(Duration(milliseconds: 900), () {
      setState(() {
        plus_scale = "show";
      });
      Timer(Duration(milliseconds: 500), () {
        setState(() {
          plus_scale = "show2";
        });
        Timer(Duration(milliseconds: 500), () {
          setState(() {
            plus_scale = "show3";
          });
          Timer(Duration(milliseconds: 1000), () {
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) {
              return new Layouts();
            }));
          });
        });
      });
    });
    // Timer(Duration(milliseconds: 1100), () {
    //   Navigator.pushReplacement(context,
    //       new MaterialPageRoute(builder: (context) {
    //     return new Layouts();
    //   }));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 53, 57, 235),
        child: Center(
            child: Stack(
          children: [
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 600),
                width: hearth == true ? 148.37 : 0,
                height: hearth == true ? 123.42 : 0,
                child: Image(
                  image: AssetImage("assets/images/splash_love.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Center(
            //   child: Expanded(child: Container(
            //     width: 60000,
            //     height: 60000,
            //     color: Colors.black,
            //     child: Image(
            //           image: AssetImage("assets/images/splash_plus.png"),
            //           fit: BoxFit.fitHeight,
            //         ),
            //   ),),
            // )
            Center(
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: plus_scale == "hidden"
                      ? 0
                      : plus_scale == "show"
                          ? 60
                          : MediaQuery.of(context).size.height,
                  width: plus_scale == "hidden"
                      ? 0
                      : plus_scale == "show"
                          ? 60
                          : MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Center(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          height: plus_scale == "hidden"
                              ? 0
                              : plus_scale == "show"
                                  ? 60
                                  : plus_scale == "show2"
                                      ? MediaQuery.of(context).size.height
                                      : MediaQuery.of(context).size.height,
                          width: plus_scale == "hidden"
                              ? 0
                              : plus_scale == "show"
                                  ? 20
                                  : plus_scale == "show2"
                                      ? MediaQuery.of(context).size.width / 2
                                      : MediaQuery.of(context).size.width,
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            height: plus_scale == "hidden"
                                ? 0
                                : plus_scale == "show"
                                    ? 20
                                    : plus_scale == "show2"
                                        ? MediaQuery.of(context).size.width / 2
                                        : MediaQuery.of(context).size.height,
                            width: plus_scale == "hidden"
                                ? 0
                                : plus_scale == "show"
                                    ? 60
                                    : plus_scale == "show2"
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.width,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        )),
      ),
    );
  }
}

class Layouts extends StatefulWidget {
  const Layouts({super.key});

  @override
  State<Layouts> createState() => _LayoutsState();
}

class _LayoutsState extends State<Layouts> {
  bool welcome_page = false;
  bool login_page = false;

  void toRedirect() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("welcome");
    pref.remove("login");
    setState(() {
      welcome_page = (pref.getBool("welcome") ?? false);
      login_page = (pref.getBool("login") ?? false);
    });
  }

  void initState() {
    super.initState();
    toRedirect();
  }

  var inisialisasi;
  @override
  Widget build(BuildContext context) {
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

