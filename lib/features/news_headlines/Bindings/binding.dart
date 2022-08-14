import 'package:get/instance_manager.dart';
import 'package:news_app/core/repository/news_repo_impl.dart';
import 'package:news_app/features/news_headlines/Controllers/controller.dart';
import 'package:news_app/services/http_service.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }
}
