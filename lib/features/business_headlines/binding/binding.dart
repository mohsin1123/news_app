import 'package:get/get.dart';
import 'package:news_app/features/business_headlines/controller/controller.dart';
import '../../../core/repository/news_repo_impl.dart';
import '../../news_headlines/Controllers/controller.dart';

class BusinessHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(BusinessHeadlineController());
  }
}
