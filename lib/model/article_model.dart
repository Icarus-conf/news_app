import 'package:news_app/model/source_model.dart';

class Article {
  Source? source;
  String? author;
  String? description;
  String? urlToImage;
  String? content;
  String? title;
  String? url;
  String? publishedAt;

  Article({
    this.source,
    this.title,
    this.author,
    this.content,
    this.publishedAt,
    this.urlToImage,
    this.description,
    this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
