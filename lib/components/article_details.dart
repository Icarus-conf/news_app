import 'package:flutter/material.dart';
import 'package:news_app/components/text_format.dart';
import 'package:news_app/model/article_model.dart';

class ArticleDetails extends StatelessWidget {
  static const String routeName = 'ArticleDetails';

  final Article? article;
  ArticleDetails({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: PoppinsText(
          text: article!.title!,
          fontS: 18,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Image.network(
            article!.urlToImage ?? 'https://source.unsplash.com/random',
          ),
          Container(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: PoppinsText(
                    text: article!.source!.name!,
                    fontS: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView(
                children: [
                  PoppinsText(
                    text: article!.title!,
                    fontS: 18,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  PoppinsText(
                    text: article!.author!,
                    fontS: 18,
                    color: Colors.blueGrey,
                  ),
                  PoppinsText(
                    text: article!.publishedAt!,
                    fontS: 12,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  PoppinsText(
                      text: 'Description: ${article!.description!}', fontS: 12),
                  Divider(),
                  PoppinsText(
                    text: article!.content!,
                    fontS: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
