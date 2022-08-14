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

  @override
  Future<List<Article>> getSearchedNew() async {
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
