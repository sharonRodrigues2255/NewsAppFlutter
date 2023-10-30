import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controller/homepage_controller.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.provider,
  });

  final HomepageController provider;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
          10,
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
                          image: NetworkImage(
                            provider.headlinesdata?.articles?[index]
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
                          provider.headlinesdata?.articles?[index].title ??
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
    );
  }
}
