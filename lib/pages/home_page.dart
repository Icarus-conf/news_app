import 'package:flutter/material.dart';
import 'package:news_app/components/article_tile.dart';
import 'package:news_app/components/text_format.dart';
import 'package:news_app/model/article_model.dart';

import 'package:news_app/services/news_api.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'HomePage';
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsApi newsApi = NewsApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: newsApi.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article> articles = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: PoppinsText(
                text: 'NewsApp',
                fontS: 24,
                color: Colors.white,
              ),
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
            ),
            body: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return ArticleTile(article: articles[index]);
              },
            ),
          );
        }
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
