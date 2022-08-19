import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/widgets/drawer.dart';
import 'package:news_app/features/article/article_page.dart';
import 'package:news_app/features/travel_headlines/controllers/travel_controller.dart';

class TravelHeadlinesView extends StatefulWidget {
  const TravelHeadlinesView({Key? key}) : super(key: key);

  @override
  State<TravelHeadlinesView> createState() => _TravelHeadlinesViewState();
}

class _TravelHeadlinesViewState extends State<TravelHeadlinesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel'),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("SearchNews");
              },
              icon: Icon(Icons.search))
        ],
      ),
      drawer: getAppDrawer(),
      body: NewsBoxes(context),
    );
  }
}

// ignore: non_constant_identifier_names
Widget NewsBoxes(BuildContext context) {
  final controller = Get.find<TravelHeadlineController>();
  return Obx(() {
    return controller.isloading.isTrue
        ? const Center(
            child: CircularProgressIndicator(),
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
                              urlToPage: controller.articles[index].url))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ignore: unnecessary_null_comparison
                      controller.articles[index].urlToImage == null
                          ? const SizedBox(
                              height: 300,
                              child: Center(child: CircularProgressIndicator()))
                          : CachedNetworkImage(
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => SizedBox(
                                        height: 300,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                        ),
                                      ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageUrl: controller.articles[index].urlToImage
                                  .toString()),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        controller.articles[index].title.toString(),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Text(
                        controller.articles[index].description.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.articles[index].author.toString(),
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.red),
                          ),
                          Text(
                            controller.articles[index].publishedAt.toString(),
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.red),
                          ),
                        ],
                      ),
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
  });
}
