import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/article_model.dart';

const apiKey = '050460483215412993fe3f8dcebc160c';

class NewsApi {
  Future<List<Article>> getArticle() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/everything?q=technology&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> newsData = jsonDecode(response.body);

      List<dynamic> body = newsData['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't find the article.");
    }
  }
}
