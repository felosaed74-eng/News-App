import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 121, 10, 2),
        title: Text(
          "News",
          style: TextStyle(
            fontSize: 28,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),

      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => NewsItem(),
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount: 10,
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.details);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 8),
            CustomImageNews(),
            SizedBox(height: 8),
            Text(
              "Ninja",
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w400,
                color: Color(0xffB0B3B8),
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Ninja is very strong",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w400,
                color: Color(0xffE4E6EB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImageNews extends StatelessWidget {
  const CustomImageNews({super.key, this.hight = 200});

  final double hight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => Column(
          mainAxisAlignment: .center,
          children: [CircularProgressIndicator()],
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        width: double.infinity,
        height: hight,
        fit: .cover,
      ),
    );
  }
}

String image =
    "https://th.bing.com/th/id/OIP.WkbTF30s9ZZrETXtbOQayAHaEK?w=304&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3";
