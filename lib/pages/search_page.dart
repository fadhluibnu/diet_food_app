import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller_search = TextEditingController();
  static const IconData icon_filter =
      IconData(0xe802, fontFamily: "filter_icon", fontPackage: null);
  bool filter_color = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("history")
    );
  }
}
