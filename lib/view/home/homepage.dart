import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controller/homepage_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomepageController>(context, listen: false).fetchdatacarousal();
    Provider.of<HomepageController>(context, listen: false)
        .fetchdatacategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomepageController>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFF362626),
        title: Text("Newz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: () async {
            await provider.onRefrsh();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Top Headlines",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
                if (!provider.headlinesisLoading)
                  CarouselSlider(
                    items: List.generate(
                        10,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 170,
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          provider
                                                  .headlinesdata
                                                  ?.articles?[index]
                                                  .urlToImage ??
                                              "https://bitsofco.de/img/Qo5mfYDE5v-350.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        provider.headlinesdata?.articles?[index]
                                                .title ??
                                            "No data",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                    options: CarouselOptions(
                      height: 240,
                      aspectRatio: 4 / 8,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 4),
                    ),
                  )
                else
                  Center(child: CircularProgressIndicator()),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF432A2A),
                    ),
                    child: const Row(
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            provider.setCategories(index);
                            print(provider.categoriesIndex);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: index == provider.categoriesIndex
                                  ? Colors.redAccent
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 100,
                            height: 40,
                            child: Center(child: Text(categories[index])),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (!provider.categoriesLoading)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15, right: 14, top: 15),
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(provider
                                                  .catogoriesContents
                                                  ?.articles?[index]
                                                  .urlToImage ??
                                              "https://bitsofco.de/img/Qo5mfYDE5v-350.png"))),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 130,
                                width: double.infinity,
                                child: Text(
                                  provider.catogoriesContents?.articles?[index]
                                          .title ??
                                      "nothing",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                else
                  Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> categories = [
  "All",
  "Business",
  "Entertainment",
  "Science",
  "Sports",
  "Technology",
];
