import 'package:flutter/material.dart';
import 'package:news_app/controller/search_controller.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/view/detailed_news/detailed_page.dart';
import 'package:provider/provider.dart';

TextEditingController searchController = TextEditingController();

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    final provider =
        Provider.of<SearchControllerProvider>(context, listen: false);
    if (provider.searchDData == null) {
      Future.delayed(Duration.zero, () {
        Provider.of<SearchControllerProvider>(context, listen: false)
            .fetchSearchData("Latest news");
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchControllerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        title: Text("Search"),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(2),
                    border: OutlineInputBorder(gapPadding: 2.0),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: InkWell(
                      onTap: () {
                        provider.fetchSearchData(searchController.text);
                        FocusScope.of(context).unfocus();
                      },
                      child: Container(
                          color: Colors.teal,
                          child: Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                          )),
                    ),
                    hintText: "Search for latest news"),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: provider.isLoading == false
                      ? ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  final news =
                                      provider.searchDData?.articles?[index];
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailedNews(
                                            title: news?.title ?? "",
                                            description:
                                                news?.description ?? "",
                                            imageUrl: news?.urlToImage ?? "",
                                            author: news?.author ?? "",
                                            source: news?.content ?? "",
                                          )));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 170,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            provider
                                                    .searchDData
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
                                          provider.searchDData?.articles?[index]
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
                              ),
                            );
                          })
                      : SizedBox(
                          height: 300,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
