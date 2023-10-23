import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List categories = ["All", "Bussiness", "Politics", "Tech", "Sports"];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 54, 38, 38),
        title: Text("Newz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            CarouselSlider(
                items: [
                  Container(
                      color: Colors.amber,
                      height: 200,
                      width: MediaQuery.of(context).size.width - 80),
                ],
                options: CarouselOptions(
                    height: 200,
                    aspectRatio: 4 / 7,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2))),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: const Color.fromARGB(255, 67, 42, 42)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.search,
                      size: 23,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 45,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(15)),
                        width: 100,
                        height: 40,
                        child: Center(child: Text(categories[index])),
                      ),
                    );
                  }),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.amber,
                              )),
                          Expanded(
                            child: Container(
                              color: Colors.red,
                            ),
                            flex: 5,
                          )
                        ],
                      ),
                    ),
                  );
                })
          ]),
        ),
      ),
    );
  }
}
