import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class HomepageController with ChangeNotifier {
// topheadlines carousal

  bool headlinesisLoading = false;
  NewsModel? headlinesdata;

  onRefrsh() {
    headlinesisLoading = false;
    notifyListeners();
    Future.delayed(Duration.zero, () async {
      await fetchdatacarousal();
      await fetchdatacategories();
    });
  }

  fetchdatacarousal() async {
    headlinesisLoading = true;
    notifyListeners();
    var caurouselurl = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=a20461708c1a46d7a14cd2216be1f6b0");
    final response = await http.get(caurouselurl);
    if (response.statusCode == 200) {
      headlinesdata = NewsModel.fromJson(jsonDecode(response.body));
    }

    headlinesisLoading = false;
    notifyListeners();
  }

  int categoriesIndex = 0;

  void setCategories(int index) {
    categoriesIndex = index;
    notifyListeners();
    fetchdatacategories();
  }

  bool categoriesLoading = false;

  NewsModel? catogoriesContents;

  fetchdatacategories() async {
    categoriesLoading = true;
    notifyListeners();
    String category;
    if (categoriesIndex == 0) {
      category = general;
    } else if (categoriesIndex == 1) {
      category = business;
    } else if (categoriesIndex == 2) {
      category = entertainment;
    } else if (categoriesIndex == 3) {
      category = science;
    } else if (categoriesIndex == 4) {
      category = sports;
    } else {
      category = tech;
    }

    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$category&apiKey=a20461708c1a46d7a14cd2216be1f6b0');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      catogoriesContents = NewsModel.fromJson(jsonDecode(response.body));
      print(catogoriesContents?.articles?[0].urlToImage);
    }

    categoriesLoading = false;
    notifyListeners();
  }
}

String business = "business";
String entertainment = "entertainment";
String science = "science";
String general = "general";
String sports = "sports";
String tech = "technology";
