import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/data/api/app_api.dart';
import 'package:news_app/features/view/screen/details_screen.dart';
import 'package:news_app/features/view/screen/home_screen.dart';

void main() {
  AppApi.getNews();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.details: (context) => DetailsScreen(),
        AppRoutes.home: (context) => HomeScreen(),
      },
    );
  }
}
