import 'package:get/get.dart';
import 'package:news_app/features/fashion_headlines/controllers/fashion_controller.dart';
import '../../../core/repository/news_repo_impl.dart';

class FashionHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(FashionHeadlineController());
  }
}
