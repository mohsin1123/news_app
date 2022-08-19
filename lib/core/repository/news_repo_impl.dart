import 'package:get/instance_manager.dart';
import 'package:news_app/core/models/news_response.dart';
import 'package:news_app/core/repository/news_repository.dart';
import 'package:news_app/services/http_service.dart';
import 'package:news_app/services/http_service_impl.dart';

import '../models/article_model.dart';

class NewsRepoImpl implements NewsRepo {
  HttpService? _httpService;

  var query;

  NewsRepoImpl() {
    _httpService = Get.put(httpsServiceImpl());
    _httpService!.init();
  }

  //ENTERTAINMENT HEADLINES
  @override
  Future<List<Article>> getEntertainmentHeadlines() async {
    try {
      final response =
          await _httpService!.getRequest("/v2/everything?q=entertainment");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }

//HEALTH HEADLINES
  @override
  Future<List<Article>> getHealthHeadlines() async {
    try {
      final response =
          await _httpService!.getRequest("/v2/everything?q=health");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }
  //SPORTS HEADLINES

  @override
  Future<List<Article>> getSportsHeadlines() async {
    try {
      final response =
          await _httpService!.getRequest("/v2/everything?q=sports");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }

//FOOD HEADLINES
  @override
  Future<List<Article>> getFoodHeadlines() async {
    try {
      final response = await _httpService!.getRequest("/v2/everything?q=food");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }

//FASHION HEADLINES
  @override
  Future<List<Article>> getFashionHeadlines() async {
    try {
      final response =
          await _httpService!.getRequest("/v2/everything?q=fashion");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }

  //TRAVEL HEADLINES

  @override
  Future<List<Article>> getTravelHeadlines() async {
    try {
      final response =
          await _httpService!.getRequest("/v2/everything?q=travel");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }

  //BUSINESS HEADLINE

  @override
  Future<List<Article>> getBusinessHeadline() async {
    try {
      final response =
          await _httpService!.getRequest("/v2/everything?q=business");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }

  //COVID HEADLINES

  @override
  Future<List<Article>> getCOVIDHeadline() async {
    try {
      final response = await _httpService!.getRequest("/v2/everything?q=covid");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }

  //NEWS HEADLINES

  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      final response =
          await _httpService!.getRequest("/v2/top-headlines?country=us");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    throw UnimplementedError();
  }

  //SEARCHED NEWS

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    try {
      final response =
          await _httpService!.getRequest("/v2/everything?q=$query");
      final parsedresponse = NewsResponse.fromJson(response.data);

      return parsedresponse.articles;
    } on Exception catch (e) {
      print(e);
    }
    // TODO: implement getSearchedNew
    throw UnimplementedError();
  }
}
