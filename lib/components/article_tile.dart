import 'package:flutter/material.dart';
import 'package:news_app/components/article_details.dart';
import 'package:news_app/components/text_format.dart';
import 'package:news_app/model/article_model.dart';

class ArticleTile extends StatelessWidget {
  static const String routeName = 'ArticleTile';
  final Article? article;
  ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetails(
                  article: article,
                ),
              ));
        },
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                child: Image.network(
                  article!.urlToImage ?? 'https://source.unsplash.com/random',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(),
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
                    SizedBox(
                      height: 15,
                    ),
                    PoppinsText(
                      text: article!.title!,
                      fontS: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
