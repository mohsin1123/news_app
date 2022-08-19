import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/models/article_model.dart';
import '../../../core/repository/news_repo_impl.dart';
import '../../../core/repository/news_repository.dart';

class SearchNewsController extends GetxController {
  late NewsRepo _newsRepo;

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();

    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  RxList<Article> articles = RxList();

  searchNewsHeadline() async {
    showLoading();

    final result = await _newsRepo.getSearchedNews(searchTextController.text);

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("No data recieved");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
