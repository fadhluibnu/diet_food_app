import 'package:diet_food_app/content/content_pages.dart';
import 'package:diet_food_app/pages/search_page.dart';
import 'package:diet_food_app/route_animation/route_slide_animation.dart';
import 'package:diet_food_app/template/pages_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController controller_search = TextEditingController();
  static const IconData icon_filter =
      IconData(0xe802, fontFamily: "filter_icon", fontPackage: null);

  List<Widget> _widgetData = [];

  bool filter_color = false;

  setBoolSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('value', "true");
  }

  String test = "false";

  void getBollSP() async {
    SharedPreferences prefsget = await SharedPreferences.getInstance();
    setState(() {
      test = (prefsget.getString("value") ?? "false");
    });
    // return prefs;
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popular Diet",
                  style:
                      TextStyle(fontFamily: 'poppins_medium', fontSize: 20),
                ),
              ]),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(RouteSlideAnimation(
                          child: ContentPage(),
                          direction: AxisDirection.left));
                    },
                    child: Container(
                      width: 267,
                      height: 305,
                      color: Colors.black12,
                      child: Stack(
                        children: [
                          Image(
                            image:
                                AssetImage("assets/images/mayo_diet.png"),
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 142,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Colors.transparent,
                                    Colors.black
                                  ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                              child: Align(
                                alignment: Alignment(0, 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Mayo Diet",
                                        style: TextStyle(
                                            fontFamily: 'poppins_medium',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-1, -1),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 68,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 5),
                                decoration: BoxDecoration(
                                    color:
                                        Color.fromARGB(174, 141, 141, 141),
                                    borderRadius:
                                        BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.person, color: Colors.white),
                                    Text(
                                      "255",
                                      style: TextStyle(
                                          fontFamily: 'poppins_regular',
                                          color: Colors.white,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 267,
                    height: 305,
                    color: Colors.black12,
                    child: Stack(
                      children: [
                        Image(
                          image: AssetImage("assets/images/mayo_diet.png"),
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 16, 10, 0),
          child: Column(
            children: [
              Align(
                alignment: Alignment(-1, 0),
                child: Text(
                  "Recent Program",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'poppins_medium',
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Stack(children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        image: AssetImage("assets/images/mayo_diet.png"),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Color.fromARGB(190, 0, 0, 0),
                              Colors.transparent
                            ],
                                begin: Alignment.topLeft,
                                end: Alignment.topRight)),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(35),
                          child: Text(
                            "Mayo Diet",
                            style: TextStyle(
                                fontFamily: 'poppins_medium',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Stack(children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        image: AssetImage("assets/images/mayo_diet.png"),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Color.fromARGB(190, 0, 0, 0),
                              Colors.transparent
                            ],
                                begin: Alignment.topLeft,
                                end: Alignment.topRight)),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(35),
                          child: Text(
                            "Mayo Diet",
                            style: TextStyle(
                                fontFamily: 'poppins_medium',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
