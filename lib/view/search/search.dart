import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Text("Search"),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(2),
                  border: OutlineInputBorder(gapPadding: 2.0),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Container(
                      color: Colors.teal,
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      )),
                  hintText: "Search for latest news"),
            )
          ],
        ),
      ),
    );
  }
}
