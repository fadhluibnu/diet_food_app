import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController controller_search = TextEditingController();

  List<Widget> _widgetData = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 235, 239, 243),
      ),
      child: SingleChildScrollView(
        // padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Valerine",
                      style:
                          TextStyle(fontFamily: 'poppins_medium', fontSize: 16),
                    ),
                    Text(
                      "Good Morning",
                      style:
                          TextStyle(fontFamily: 'poppins_bold', fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: TextField(
                              controller: controller_search,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  hintText: "“Diet Mayo”",
                                  hintStyle: TextStyle(
                                      fontFamily: 'poppins_regular',
                                      color: Color.fromARGB(255, 141, 141, 141),
                                      fontSize: 14),
                                  prefixIcon: Icon(Icons.search),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0))),
                            ),
                          ),
                          Flexible(
                              flex: 1,
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ElevatedButton(
                                      child: Icon(
                                        Icons.sort,
                                        color:
                                            Color.fromARGB(255, 114, 116, 255),
                                      ),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 201, 239, 255),
                                        shadowColor: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
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
                    padding: EdgeInsets.only(left: 10),
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
                                      color: Color.fromARGB(174, 141, 141, 141),
                                      borderRadius: BorderRadius.circular(20)),
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
        ),
      ),
    );
  }
}
