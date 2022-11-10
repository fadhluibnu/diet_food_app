import 'package:diet_food_app/pages/home_page.dart';
import 'package:diet_food_app/pages/profile_page.dart';
import 'package:diet_food_app/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PagesTemplate extends StatefulWidget {
  final pages;
  final index;
  const PagesTemplate({super.key, this.pages, this.index});

  @override
  State<PagesTemplate> createState() => _PagesTemplateState();
}

class _PagesTemplateState extends State<PagesTemplate> {
  // void _changeSelectedPage(index) {
  //   setState(() {
  //     _selectedPage = index;
  //   });
  // }

  // icon home
  static const IconData icon_home =
      IconData(0xe801, fontFamily: "icon_home_fill", fontPackage: null);
  static const IconData icon_home_outline =
      IconData(0xe803, fontFamily: "home_outline_icon", fontPackage: null);

  // icon search
  static const IconData icon_search =
      IconData(0xe800, fontFamily: "search_icon", fontPackage: null);
  @override
  Widget build(BuildContext context) {
    var _selectedPage = widget.index;
    return Scaffold(
        body: widget.pages,
        // _selectedPage == 0
        //     ? HomePage()
        //     : _selectedPage == 1
        //         ? SearchPage()
        //         : ProfilePage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(
              255,
              114,
              116,
              255,
            ),
            onPressed: () {},
            child: Icon(
              Icons.add,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 40, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        if (_selectedPage != 0) {
                          Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      PagesTemplate(
                                        pages: HomePage(),
                                        index: 0,
                                      ),
                                  // transitionDuration: Duration.zero,
                                  // reverseTransitionDuration: Duration.zero
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(0, 0);
                                    const end = Offset.zero;

                                    const curves = Curves.easeInOut;

                                    var twwn = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curves));

                                    return SlideTransition(
                                      position: animation.drive(twwn),
                                      child: child,
                                    );
                                  })
                              //     MaterialPageRoute(builder: (context) {
                              //   return PagesTemplate(
                              //     pages: SearchPage(),
                              //     index: 1,
                              //   );
                              // })
                              );
                        }
                        // _changeSelectedPage(0);
                      },
                      icon: _selectedPage == 0
                          ? Icon(
                              icon_home,
                              color: Color.fromARGB(
                                255,
                                114,
                                116,
                                255,
                              ),
                              size: 20,
                            )
                          : Icon(
                              icon_home_outline,
                              color: Color.fromARGB(255, 141, 141, 141),
                              size: 20,
                            )),
                  IconButton(
                      onPressed: () {
                        if (_selectedPage != 1) {
                          Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      PagesTemplate(
                                        pages: SearchPage(),
                                        index: 1,
                                      ),
                                  // transitionDuration: Duration.zero,
                                  // reverseTransitionDuration: Duration.zero
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(0, 0);
                                    const end = Offset.zero;

                                    const curves = Curves.easeInOut;

                                    var twwn = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curves));

                                    return SlideTransition(
                                      position: animation.drive(twwn),
                                      child: child,
                                    );
                                  })
                              //     MaterialPageRoute(builder: (context) {
                              //   return PagesTemplate(
                              //     pages: SearchPage(),
                              //     index: 1,
                              //   );
                              // })
                              );
                        }
                        // _changeSelectedPage(1);
                      },
                      icon: _selectedPage == 1
                          ? Icon(
                              Icons.search,
                              color: Color.fromARGB(
                                255,
                                114,
                                116,
                                255,
                              ),
                              size: 25,
                            )
                          : Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 141, 141, 141),
                              size: 25,
                            )),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: IconButton(
                        onPressed: () {
                          // _changeSelectedPage(2);
                        },
                        icon: _selectedPage == 2
                            ? Icon(Icons.person_rounded,
                                size: 25,
                                color: Color.fromARGB(
                                  255,
                                  114,
                                  116,
                                  255,
                                ))
                            : Icon(Icons.person_outline_rounded,
                                size: 25,
                                color: Color.fromARGB(255, 141, 141, 141))),
                  ),
                ]),
          ),
        ));
  }
}
