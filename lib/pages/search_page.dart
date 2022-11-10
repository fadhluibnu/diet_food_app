import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: "gmorning",
        child: Text(
          "Good Morning",
          style: TextStyle(fontFamily: 'poppins_bold', fontSize: 24),
        ),
      ),
    );
  }
}
