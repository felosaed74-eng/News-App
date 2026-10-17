import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/presentation/view/widgets/new_item_widget.dart';
import 'package:news_app/features/presentation/view_model/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit();
    cubit.geAllArticles();
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

      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is HomeSuccess) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) =>
                  NewsItem(article: cubit.article[index]),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: cubit.article.length,
            );
          }

          if (state is HomeError) {
            return Center(
              child: Text(
                cubit.error ?? "",
                style: TextStyle(fontSize: 20, color: Colors.red),
                textAlign: .center,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

String image =
    "https://th.bing.com/th/id/OIP.WkbTF30s9ZZrETXtbOQayAHaEK?w=304&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3";
