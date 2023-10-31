class ApiEndPoints {
  static String baseUrl = "https://newsapi.org/v2";
  static String searchQueryUrl({required String search}) {
    return "/everything?q=$search";
  }
}
