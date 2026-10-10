import 'package:flutter/material.dart';
import 'package:news_app/features/view/screen/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 121, 10, 2),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Details News",
          style: TextStyle(
            fontSize: 25,
            fontWeight: .bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 30),
            CustomImageNews(hight: 300),
            SizedBox(height: 24),
            Text(
              "Ninja",
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w400,
                color: Color(0xffB0B3B8),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Ninja is very strong",
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w400,
                color: Color(0xffE4E6EB),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Avagabond swordsman is aided by a kunoichi and a spy in battling a demonic clan of killers led by a ghost from his past, who are bent on overthrowing the Tokugawa Shogunate.",
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
