import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  static const String _apiKey = '09d2afeaade147359ce6a27a1aead520';

  static Uri _urlLinkCategory({String? category}) {
    return Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$_apiKey');
  }

  static Uri _urlLinkSource({String? source}) {
    return Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=$source&apiKey=$_apiKey');
  }

  static Uri _urlLinkAllNews({String? source}) {
    return Uri.parse(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=$_apiKey');
  }

  // ------------- GET TOP HEADLINE BY COUNTRY --------------

  static getTopHeadlineByCategory({
    required String category,
  }) async {
    var url = _urlLinkCategory(category: category);

    var response = await http.get(url);

    var body = response.body;
    var decode = json.decode(body);

    return decode;
  }

  // ---------------- GET BY SOURCE ---------------------

  static getNewsBySource({required String source}) async {
    var url = _urlLinkSource(source: source);

    var response = await http.get(url);

    var body = response.body;
    var decode = json.decode(body);

    return decode;
  }

  // ---------------- GET ALL NEWS CHANNEL --------------------

  static getAllNewsChannel() async {
    var url = _urlLinkAllNews();

    var response = await http.get(url);

    var body = response.body;
    var decode = json.decode(body);

    return decode;
  }
}
