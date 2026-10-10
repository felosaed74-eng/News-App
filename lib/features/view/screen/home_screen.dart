import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/features/data/api/app_api.dart';
import 'package:news_app/features/data/model/news_model.dart';
import 'package:news_app/features/view/widgets/new_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> article = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    geAllArticles();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(232, 22, 1, 111),
        title: Text(
          "News",
          style: TextStyle(
            fontSize: 28,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : error != null
          ? Text(error ?? "", style: TextStyle(fontSize: 20, color: Colors.red))
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) =>
                  NewsItem(article: article[index]),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: article.length,
            ),
    );
  }

  void geAllArticles() async {
    isLoading = true;
    final result = await AppApi.getNews();
    switch (result) {
      case Success<NewsModel>():
        log("Success State ${result.data.articles}");
        article = result.data.articles ?? [];
      case Error<NewsModel>():
        log("Error State ${result.error}");
        error = result.error;
    }

    isLoading = false;
    setState(() {});
  }
}

String image =
    "https://th.bing.com/th/id/OIP.WkbTF30s9ZZrETXtbOQayAHaEK?w=304&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3";
