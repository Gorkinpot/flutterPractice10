import 'package:project/models/article.dart';

class TipsService {
  List<Article> articles = [];

  void addArticle(Article article) {
    articles.add(article);
  }
}
