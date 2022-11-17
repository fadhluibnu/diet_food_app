import 'package:diet_food_app/pages/home_page.dart';
import 'package:diet_food_app/pages/profile_page.dart';
import 'package:diet_food_app/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PagesTemplateg extends StatefulWidget {
  final pages;
  final index;
  const PagesTemplateg({super.key, this.pages, this.index});

  @override
  State<PagesTemplateg> createState() => _PagesTemplategState();
}

class _PagesTemplategState extends State<PagesTemplateg> {
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
        body: SafeArea(child: widget.pages),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 62, 109, 156),
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
        )
        );
  }
}
