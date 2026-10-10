import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/features/data/model/news_model.dart';

abstract class AppApi {
  static Future<ApiResult<NewsModel>> getNews() async {
    try {
      //https://newsapi.org/v2/everything?q=apple&from=2026-10-09&to=2026-10-09&sortBy=popularity&apiKey=0b2ef2ba689a42c3babacf588e8bbbad
      var response = await http.get(
        Uri.parse(
          "https://newsapi.org/v2/everything?q=apple&from=2026-10-09&to=2026-10-09&sortBy=popularity&apiKey=0b2ef2ba689a42c3babacf588e8bbbad",
        ),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return Success(NewsModel.fromJson(json));
    } catch (e) {
      return Error(e.toString());
    }
  }
}
