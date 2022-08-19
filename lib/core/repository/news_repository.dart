import 'package:news_app/core/models/article_model.dart';

abstract class NewsRepo {
  Future<List<Article>> getNewsHeadline();
  Future<List<Article>> getBusinessHeadline();
  Future<List<Article>> getCOVIDHeadline();
  Future<List<Article>> getEntertainmentHeadlines();
  Future<List<Article>> getHealthHeadlines();
  Future<List<Article>> getSportsHeadlines();
  Future<List<Article>> getFoodHeadlines();
  Future<List<Article>> getFashionHeadlines();
  Future<List<Article>> getTravelHeadlines();
  Future<List<Article>> getSearchedNews(String text);
}
