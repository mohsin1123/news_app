import 'package:get/get.dart';
import 'package:news_app/features/sports_headlines/controller/sports_controller.dart';
import '../../../core/repository/news_repo_impl.dart';

class SportsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(SportsHeadlineController());
  }
}
