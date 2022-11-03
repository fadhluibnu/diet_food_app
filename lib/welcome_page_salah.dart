import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String page_hide = 'none';
  String currect_btn = 'one';

  Widget pageOne() {
    return AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
      TyperAnimatedText(
          "When you talk, you are only repeating, talk, you page 1",
          speed: Duration(milliseconds: 45)),
    ]);
  }

  Widget pageTwo() {
    return AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
      TyperAnimatedText(
          "When you talk, you are only repeating, talk, you page 2",
          speed: Duration(milliseconds: 45)),
    ]);
  }

  Widget pageThree() {
    return AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
      TyperAnimatedText(
          "When you talk, you are only repeating, talk, you page 3",
          speed: Duration(milliseconds: 45)),
    ]);
  }

  void slidePage() {
    if (currect_btn == 'one') {
      setState(() {
        page_hide = 'one';
        currect_btn = 'two';
      });
    } else if (currect_btn == 'two') {
      setState(() {
        page_hide = 'two';
        currect_btn = 'three';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            left: page_hide == 'none' ? 0 : -MediaQuery.of(context).size.width,
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
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            left: page_hide == 'one'
                ? 0
                : page_hide == 'two'
                    ? -MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width + 0.1,
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
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            left: page_hide == 'two'
                ? 0
                : MediaQuery.of(context).size.width + 0.1,
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
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                child: AnimatedTextKit(
                                    isRepeatingAnimation: false,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                          "When you talk, you are only repeating, talk, you page 1",
                                          speed: Duration(milliseconds: 45)),
                                    ]),
                              ),
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () {
                                  slidePage();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text("Next"),
                                )))
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
