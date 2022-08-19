import 'package:get/get.dart';
import 'package:news_app/features/health_headlines/controllers/health_controller.dart';
import '../../../core/repository/news_repo_impl.dart';

class HealthHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(HealthHeadlineController());
  }
}
