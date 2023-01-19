import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 62, 109, 156),
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(bottom: 10),
                  //  padding: EdgeInsets.fromLTRB(10, 10, 10, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white, size: 16)),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text("Change",
                                style: TextStyle(
                                    fontFamily: "poppins_regular",
                                    fontSize: 20,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 32, top: 20),
                  child: Text(
                      "Please complete the data below to change the password",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "poppins_regular"
                      )
                  )
              ),
              InputField("Current password", "Enter yout password"),
              InputField("New password", "Enter yout password"),
              InputField("Confirm New password", "Enter yout password"),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ChangePassword();
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
                      )
                  ),
                ),
              ),
            ]
          ),
        )
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String text;
  final String hintText;
  const InputField(
      this.text,
      this.hintText,
      {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(text, style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins_regular'
                ))
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: TextField(
                // controller: email_address,
                cursorColor: Color.fromARGB(255, 82, 82, 82),
                style: TextStyle(
                  fontFamily: "poppins_regular",
                  color: Color.fromARGB(255, 82, 82, 82),
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 141, 141, 141)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color.fromARGB(244, 141, 141, 141), width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color.fromARGB(244, 141, 141, 141), width: 0)),
                )),
          ),
        ],
      ),
    );
  }
}
