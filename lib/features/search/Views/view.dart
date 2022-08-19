import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:news_app/core/widgets/drawer.dart';
import 'package:news_app/features/search/Controllers/controller.dart';

import '../../article/article_page.dart';

class SearchNewsScreen extends StatelessWidget {
  const SearchNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search News",
          ),
          backgroundColor: Colors.blue.shade900,
        ),
        drawer: getAppDrawer(),
        body: SearchFeature(context));
  }
}

Widget SearchFeature(BuildContext context) {
  final controller = Get.find<SearchNewsController>();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller.searchTextController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
      Expanded(child: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.articles.isEmpty
                ? const Center(
                    child: Text("No News Found!"),
                  )
                : Container(
                    margin: const EdgeInsets.all(10),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticlePage(
                                      urlToPage:
                                          controller.articles[index].url))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.articles[index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              // ignore: unnecessary_null_comparison
                              controller.articles[index].urlToImage == null
                                  ? const SizedBox(
                                      height: 300,
                                      child: Center(
                                          child: CircularProgressIndicator()))
                                  : CachedNetworkImage(
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          SizedBox(
                                            height: 300,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress),
                                            ),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      imageUrl: controller
                                          .articles[index].urlToImage
                                          .toString()),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                controller.articles[index].description
                                    .toString(),
                                style: const TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: ((context, index) => const Divider(
                            color: Colors.black,
                          )),
                      itemCount: controller.articles.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                    ),
                  );
      }))
    ],
  );
}
