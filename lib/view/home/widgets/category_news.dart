import 'package:flutter/material.dart';
import 'package:news_app/controller/homepage_controller.dart';
import 'package:news_app/view/detailed_news/detailed_page.dart';

class CategoryNews extends StatelessWidget {
  const CategoryNews({
    super.key,
    required this.provider,
  });

  final HomepageController provider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: InkWell(
            onTap: () {
              final news = provider.catogoriesContents?.articles?[index];
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailedNews(
                        title: news?.title ?? "",
                        description: news?.description ?? "",
                        imageUrl: news?.urlToImage ?? "",
                        author: news?.author ?? "",
                        source: news?.content ?? "",
                      )));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, right: 14, top: 15),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(provider.catogoriesContents
                                      ?.articles?[index].urlToImage ??
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
                      provider.catogoriesContents?.articles?[index].title ??
                          "nothing",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
