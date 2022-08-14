import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/news_headlines/Bindings/binding.dart';
import 'package:news_app/features/news_headlines/views/view.dart';
import 'package:news_app/features/search/Bindings/binding.dart';
import 'package:news_app/features/search/Views/view.dart';

import 'features/news_headlines/views/view.dart';
import 'features/search/Views/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          binding: NewsHeadlineBinding(),
          name: "/HeadLines",
          page: () => const NewsHeadlineScreen(),
        ),
        GetPage(
          binding: SearchNewsBinding(),
          name: "/SearchNews",
          page: () => const SearchNewsScreen(),
        ),
      ],
      initialRoute: "/HeadLines",
    );
  }
}
