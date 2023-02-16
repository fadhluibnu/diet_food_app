import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      home: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    color: Colors.white,
                    child: Image(
                      image: AssetImage("assets/images/mayo_diet.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 55, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 34,
                          height: 34,
                          color: Color.fromARGB(100, 255, 255, 255),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 12),
                  //   child: Container(
                  //     width: 60,
                  //     height: 60,
                  //     color: Color.fromARGB(255, 62, 109, 156),
                  //   ),
                  // ),
                ]),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 235, 239, 243),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mayo Diet",
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: "poppins_medium",
                                fontSize: 24)),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: "poppins_medium",
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            "The Mayo Diet is a diet developed by the Mayo Clinic, a nonprofit medical organization from the United States. The Mayo Clinic developed it to change your lifestyle for a healthier one.",
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: "poppins_regular",
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            "Key Points",
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: "poppins_medium",
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            "What needs to be done on this diet is not limited to food, but also about physical activity. Indeed, the theory is that energy in and out must be balanced to achieve a healthy weight.",
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: "poppins_regular",
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 12),
                          child: Text(
                            "Mayo diet menu for 5 days",
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontFamily: "poppins_medium",
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Day 1",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "poppins_medium",
                                            color: Colors.black,
                                            decoration: TextDecoration.none)),
                                    RotatedBox(
                                        quarterTurns: -3,
                                        child: Icon(
                                            Icons.arrow_forward_ios_rounded))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Day 1",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "poppins_medium",
                                            color: Colors.black,
                                            decoration: TextDecoration.none)),
                                    RotatedBox(
                                        quarterTurns: -3,
                                        child: Icon(
                                            Icons.arrow_forward_ios_rounded))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 330,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Color.fromARGB(255, 62, 109, 156),
                        child: Icon(Icons.play_arrow_rounded,
                            size: 45, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
