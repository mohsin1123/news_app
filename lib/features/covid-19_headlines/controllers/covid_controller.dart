import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/repository/news_repo_impl.dart';
import 'package:news_app/core/repository/news_repository.dart';

class COVIDHeadlineController extends GetxController {
  late NewsRepo _newsRepo;

  COVIDHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNews();
  }

  RxBool isloading = false.obs;

  late RxList<Article> articles;

  loadNews() async {
    ShowLoading();
    final result = await _newsRepo.getCOVIDHeadline();
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
