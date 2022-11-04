import 'package:diet_food_app/template/pages_template.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "App Bar",
          ),
          backgroundColor: Colors.red,
        ),
        body: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return PagesTemplate();
              }));
            },
            child: Text("To Halaman Utama")),
        // body: ,
      ),
    );
  }
}
