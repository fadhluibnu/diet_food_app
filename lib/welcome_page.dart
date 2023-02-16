import 'package:flutter/material.dart';
import 'package:diet_food_app/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeOne extends StatefulWidget {
  const WelcomeOne({super.key});

  @override
  State<WelcomeOne> createState() => _WelcomeOneState();
}

class _WelcomeOneState extends State<WelcomeOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'image1to2',
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
              child: Image(
                image: AssetImage('assets/images/home_page_one.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 410,
                    padding: EdgeInsets.fromLTRB(16, 30, 16, 30),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: "poppins_semibold",
                                  height: 1.3),
                            )),
                        Hero(
                          tag: 'btn1to2',
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) {
                                      return WelcomeTwo();
                                    }));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 62, 109, 156)
                                    ),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)))),
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: "poppins_medium",
                                      ),
                                    ),
                                  ))
                                  ),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WelcomeTwo extends StatefulWidget {
  const WelcomeTwo({super.key});

  @override
  State<WelcomeTwo> createState() => _WelcomeTwoState();
}

class _WelcomeTwoState extends State<WelcomeTwo> {
  String tag_photo = 'image1to2';
  String tag_btn = 'btn1to2';

  void change_tag() {
    setState(() {
      tag_photo = 'image2to3';
      tag_btn = 'btn2to3';
    });
  }

  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      change_tag();
      print('test');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: tag_photo,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
              child: Image(
                image: AssetImage('assets/images/home_page_three.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(16, 30, 16, 30),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: "poppins_semibold",
                                  height: 1.3),
                            )),
                        Hero(
                          tag: tag_btn,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) {
                                      return WelcomeThree();
                                    }));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 62, 109, 156)
                                    ),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)))),
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: "poppins_medium",
                                      ),
                                    ),
                                  ))
                                  ),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WelcomeThree extends StatefulWidget {
  const WelcomeThree({super.key});

  @override
  State<WelcomeThree> createState() => _WelcomeThreeState();
}

class _WelcomeThreeState extends State<WelcomeThree> {
  void setSharedPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("welcome", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'image2to3',
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
              child: Image(
                image: AssetImage('assets/images/home_page_two.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(16, 30, 16, 30),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: "poppins_semibold",
                                  height: 1.3),
                            )),
                        Hero(
                          tag: 'btn2to3',
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setSharedPref();
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) {
                                      return LoginPage();
                                    }));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 62, 109, 156)
                                    ),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)))),
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      "Finish",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontFamily: "poppins_medium",
                                      ),
                                    ),
                                  ))
                                  ),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
