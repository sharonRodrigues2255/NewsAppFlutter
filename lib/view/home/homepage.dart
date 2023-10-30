import 'package:flutter/material.dart';
import 'package:news_app/controller/homepage_controller.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/view/home/widgets/carousel_widget.dart';
import 'package:news_app/view/home/widgets/category_news.dart';
import 'package:news_app/view/home/widgets/horizondal_scrolling_cate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final provider = Provider.of<HomepageController>(context, listen: false);
    if (provider.headlinesdata == null && provider.catogoriesContents == null) {
      Future.delayed(Duration(seconds: 1), () {
        Provider.of<HomepageController>(context, listen: false)
            .fetchdatacarousal();
        Provider.of<HomepageController>(context, listen: false)
            .fetchdatacategories();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomepageController>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appbarColor,
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
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
                  CarouselWidget(provider: provider)
                else
                  const SizedBox(
                      height: 49,
                      child: Center(child: CircularProgressIndicator())),
                const SizedBox(height: 15),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: HorizondalScrollingCategory(provider: provider),
                ),
                if (!provider.categoriesLoading)
                  CategoryNews(provider: provider)
                else
                  SizedBox(
                      height: 250,
                      child: Center(child: CircularProgressIndicator())),
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
