import 'package:get/instance_manager.dart';
import 'package:news_app/features/search/Controllers/controller.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
