import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controller/homepage_controller.dart';
import 'package:provider/provider.dart';

List categories = ["All", "Bussiness", "Politics", "Tech", "Sports"];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomepageController>(context);
    provider.fetchdatacarousal();

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Top Headlines",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey),
              ),
            ),
            if (provider.headlinesisLoading == false)
              CarouselSlider(
                  items: List.generate(
                    provider.headlinesdata?.articles?.length ?? 0,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 170,
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(provider.headlinesdata
                                            ?.articles?[index].urlToImage ??
                                        "https://bitsofco.de/img/Qo5mfYDE5v-350.png"))),
                          ),
                          Container(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                provider.headlinesdata?.articles?[index]
                                        .title ??
                                    "no data",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                      height: 240,
                      aspectRatio: 4 / 8,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2)))
            else
              SizedBox(height: 40, child: const CircularProgressIndicator()),
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
