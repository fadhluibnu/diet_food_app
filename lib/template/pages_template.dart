import 'package:diet_food_app/pages/home_page.dart';
import 'package:diet_food_app/pages/profile_page.dart';
import 'package:diet_food_app/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PagesTemplate extends StatefulWidget {
  const PagesTemplate({super.key});

  @override
  State<PagesTemplate> createState() => _PagesTemplateState();
}

class _PagesTemplateState extends State<PagesTemplate> {
  ScrollController _controller = new ScrollController();
  int _selectedPage = 0;
  void _changeSelectedPage(index) {
    setState(() {
      _selectedPage = index;
    });
  }

  // icon home
  static const IconData icon_home =
      IconData(0xe801, fontFamily: "icon_home_fill", fontPackage: null);
  static const IconData icon_home_outline =
      IconData(0xe803, fontFamily: "home_outline_icon", fontPackage: null);

  static const IconData icon_filter =
      IconData(0xe802, fontFamily: "filter_icon", fontPackage: null);

  // icon search
  static const IconData icon_search =
      IconData(0xe800, fontFamily: "search_icon", fontPackage: null);

  bool _visibleTextWelcomeHome = true;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: 
      _selectedPage == 0?
      Color.fromARGB(255, 62, 109, 156) : _selectedPage == 1 ? Colors.transparent : Colors.transparent,
      statusBarIconBrightness: _selectedPage == 0?
      Brightness.light : _selectedPage == 1 ? Brightness.dark : Brightness.dark
    ));
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 239, 243),
          ),
          child: ListView(
              physics: const AlwaysScrollableScrollPhysics(), // new
              controller: _controller,
              children: [
                Column(
                  children: [
                    _selectedPage != 0 && _selectedPage != 1
                        ? ProfilePage()
                        : Container(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      height: _selectedPage != 0 ? 0 : 137,
                                      color: Color.fromARGB(255, 62, 109, 156),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 0, 16, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AnimatedCrossFade(
                                            duration:
                                                Duration(milliseconds: 400),
                                            firstChild: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    flex: 2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Hi, Valerine",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'poppins_medium',
                                                              fontSize: 16),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 4),
                                                          child: Text(
                                                            "Good Morning",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'poppins_bold',
                                                                fontSize: 24),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                      child: Container(
                                                    height: 48,
                                                    width: 48,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Center(
                                                        child: Icon(
                                                      Icons
                                                          .notifications_outlined,
                                                      color: Colors.white,
                                                    )),
                                                  ))
                                                ],
                                              ),
                                            ),
                                            secondChild: Container(height: 0),
                                            crossFadeState:
                                                _visibleTextWelcomeHome == true
                                                    ? CrossFadeState.showFirst
                                                    : CrossFadeState.showSecond,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: _visibleTextWelcomeHome ==
                                                        true
                                                    ? 16
                                                    : 47),
                                            child: GestureDetector(
                                              onTap: () {
                                                _changeSelectedPage(1);
                                                setState(() {
                                                  _visibleTextWelcomeHome =
                                                      false;
                                                });
                                              },
                                              child: Container(
                                                height: 54,
                                                // color: Colors.white,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                        flex: 5,
                                                        child: TextField(
                                                          onChanged: (value) {},
                                                          decoration: InputDecoration(
                                                              hintText:
                                                                  "“Diet Mayo”",
                                                              hintStyle: TextStyle(
                                                                  fontFamily:
                                                                      'poppins_regular',
                                                                  color: Color.fromARGB(
                                                                      255,
                                                                      141,
                                                                      141,
                                                                      141),
                                                                  fontSize: 14),
                                                              prefixIcon: Icon(
                                                                  Icons.search),
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              enabled:
                                                                  _visibleTextWelcomeHome ==
                                                                          true
                                                                      ? false
                                                                      : true,
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          15),
                                                                  borderSide: BorderSide(
                                                                      color:
                                                                          Colors.transparent,
                                                                      width: 0)),
                                                              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.transparent, width: 0)),
                                                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.transparent, width: 0))),
                                                        )),
                                                    Flexible(
                                                        flex: 1,
                                                        child: Container(
                                                          width: 54,
                                                          height: 54,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child: Center(
                                                            child: Icon(
                                                              icon_filter,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                _selectedPage == 0
                                    ? HomePage()
                                    : _selectedPage == 1
                                        ? SearchPage()
                                        : ProfilePage()
                              ],
                            ),
                          ),
                  ],
                ),
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            height: 60,
            width: 60,
            child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 62, 109, 156),
              onPressed: () {},
              child: Icon(
                Icons.add,
              ),
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
                        _changeSelectedPage(0);
                        setState(() {
                          _visibleTextWelcomeHome = true;
                        });
                      },
                      icon: _selectedPage == 0
                          ? Icon(
                              icon_home,
                              color: Color.fromARGB(255, 62, 109, 156),
                              size: 20,
                            )
                          : Icon(
                              icon_home_outline,
                              color: Color.fromARGB(255, 141, 141, 141),
                              size: 20,
                            )),
                  IconButton(
                      onPressed: () {
                        _changeSelectedPage(1);
                        setState(() {
                          _visibleTextWelcomeHome = false;
                        });
                      },
                      icon: _selectedPage == 1
                          ? Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 62, 109, 156),
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
                          _changeSelectedPage(2);
                          setState(() {
                            _visibleTextWelcomeHome = false;
                          });
                        },
                        icon: _selectedPage == 2
                            ? Icon(Icons.person_rounded,
                                size: 25,
                                color: Color.fromARGB(255, 62, 109, 156))
                            : Icon(Icons.person_outline_rounded,
                                size: 25,
                                color: Color.fromARGB(255, 141, 141, 141))),
                  ),
                ]),
          ),
        ));
  }
}
