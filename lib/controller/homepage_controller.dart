import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class HomepageController extends ChangeNotifier {
  bool headlinesisLoading = true;
  NewsModel? headlinesdata;
  var caurouselurl = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=360c24999e86426fb2bd46b090e07006");

  fetchdatacarousal() async {
    final response = await http.get(caurouselurl);
    if (response.statusCode == 200) {
      headlinesdata = NewsModel.fromJson(jsonDecode(response.body));
      await Future.delayed(Duration(seconds: 2));
      headlinesisLoading = false;
      notifyListeners();
    }
  }
}
