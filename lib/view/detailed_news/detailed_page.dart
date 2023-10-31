import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class DetailedNews extends StatelessWidget {
  const DetailedNews(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.author,
      required this.source});

  final String title;
  final String description;
  final String? imageUrl;
  final String source;
  final String author;

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.sizeOf(context).height;
    // final mediaWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsApp"),
        backgroundColor: appbarColor,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(imageUrl ??
                                  "https://bitsofco.de/img/Qo5mfYDE5v-350.png"))),
                      height: mediaHeight * .3,
                      width: double.infinity,
                    ),
                  ),
                  if (author.isNotEmpty) Text("Author: $author"),
                ],
              ),
            ),
            Text(
              description,
              maxLines: 100,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
