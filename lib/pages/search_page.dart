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
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 17,
                        color: Color.fromARGB(255, 141, 141, 141),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Keto Diet",
                          style: TextStyle(
                            color: Color.fromARGB(255, 141, 141, 141),
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  Icon(Icons.call_made_rounded,
                      size: 17, color: Color.fromARGB(255, 141, 141, 141))
                ],
              ),
            ),
            Container(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.delete_outline_rounded,
                        color: Color.fromARGB(255, 62, 109, 156)),
                    Text(
                      "Delete All History",
                      style: TextStyle(
                          color: Color.fromARGB(255, 62, 109, 156),
                          fontFamily: "poppins-regular",
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 62, 109, 156)),
                  color: Color.fromARGB(100, 201, 239, 255),
                  borderRadius: BorderRadius.circular(30)),
            )
          ],
        ));
  }
}
