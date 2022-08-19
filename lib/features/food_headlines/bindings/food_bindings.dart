import 'package:get/get.dart';
import 'package:news_app/features/fashion_headlines/controllers/fashion_controller.dart';
import 'package:news_app/features/food_headlines/controllers/food_controller.dart';
import '../../../core/repository/news_repo_impl.dart';

class FoodHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(FoodHeadlineController());
  }
}
