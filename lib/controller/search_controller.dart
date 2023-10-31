import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/api_key.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class SearchControllerProvider with ChangeNotifier {
  bool isLoading = false;
  NewsModel? searchDData;

  fetchSearchData(String search) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.searchQueryUrl(search: search)}${MyApi.apiKey}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      searchDData = NewsModel.fromJson(jsonDecode(response.body));
    }
    isLoading = false;
    notifyListeners();
  }
}
