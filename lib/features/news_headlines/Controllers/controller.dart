import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/repository/news_repo_impl.dart';
import 'package:news_app/core/repository/news_repository.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNews();
  }

  RxBool isloading = false.obs;

  late RxList<Article> articles;

  loadNews() async {
    ShowLoading();
    final result = await _newsRepo.getNewsHeadline();
    HideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("No data received!!!!");
    }
  }

  ShowLoading() {
    isloading.toggle();
  }

  HideLoading() {
    isloading.toggle();
  }
}
