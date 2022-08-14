import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:news_app/core/widgets/drawer.dart';
import 'package:news_app/features/news_headlines/Controllers/controller.dart';

class NewsHeadlineScreen extends StatefulWidget {
  const NewsHeadlineScreen({Key? key}) : super(key: key);

  @override
  State<NewsHeadlineScreen> createState() => _NewsHeadlineScreenState();
}

class _NewsHeadlineScreenState extends State<NewsHeadlineScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest Headlines"),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        return controller.isloading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.all(10),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.articles[index].title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              // ignore: unnecessary_null_comparison
                              controller.articles[index].urlToImage == null
                                  ? Container()
                                  : Image.network(
                                      controller.articles[index].urlToImage),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                controller.articles[index].description,
                                style: const TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: ((context, index) => const Divider()),
                    itemCount: controller.articles.indexOf(20)),
              );
      }),
    );
  }
}
