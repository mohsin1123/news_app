import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/business_headlines/binding/binding.dart';
import 'package:news_app/features/business_headlines/view/view.dart';
import 'package:news_app/features/covid-19_headlines/bindings/covid_19_binding.dart';
import 'package:news_app/features/covid-19_headlines/view/covid_19_view.dart';
import 'package:news_app/features/entertainment_headlines/bindings/entertainment_binding.dart';
import 'package:news_app/features/entertainment_headlines/views/entertainment_view.dart';
import 'package:news_app/features/fashion_headlines/bindings/fashion_bindings.dart';
import 'package:news_app/features/fashion_headlines/controllers/fashion_controller.dart';
import 'package:news_app/features/fashion_headlines/views/fashion_views.dart';
import 'package:news_app/features/food_headlines/bindings/food_bindings.dart';
import 'package:news_app/features/food_headlines/views/food_view.dart';
import 'package:news_app/features/health_headlines/bindings/health_bindings.dart';
import 'package:news_app/features/health_headlines/view/health_view.dart';
import 'package:news_app/features/news_headlines/Bindings/binding.dart';
import 'package:news_app/features/news_headlines/views/view.dart';
import 'package:news_app/features/search/Bindings/binding.dart';
import 'package:news_app/features/search/Views/view.dart';
import 'package:news_app/features/sports_headlines/binding/sports_binding.dart';
import 'package:news_app/features/sports_headlines/view/sports_view.dart';
import 'package:news_app/features/travel_headlines/binding/travel_binding.dart';
import 'package:news_app/features/travel_headlines/views/travel_views.dart';

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
      debugShowCheckedModeBanner: false,
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
          binding: EntertainmentHeadlineBinding(),
          name: "/Entertainment",
          page: () => const EntertainmentHeadlinesView(),
        ),
        GetPage(
          binding: COVIDHeadlineBinding(),
          name: "/COVID",
          page: () => const COVIDVIEWSCREEN(),
        ),
        GetPage(
          binding: BusinessHeadlineBinding(),
          name: "/Business",
          page: () => const BusinessHeadlines(),
        ),
        GetPage(
          binding: SearchNewsBinding(),
          name: "/SearchNews",
          page: () => const SearchNewsScreen(),
        ),
        GetPage(
          binding: FashionHeadlineBinding(),
          name: "/Fashion",
          page: () => const FashionHeadlineView(),
        ),
        GetPage(
          binding: FoodHeadlineBinding(),
          name: "/Food",
          page: () => const FoodHeadlineView(),
        ),
        GetPage(
          binding: HealthHeadlineBinding(),
          name: "/Health",
          page: () => const HealthHeadlineView(),
        ),
        GetPage(
          binding: SportsHeadlineBinding(),
          name: "/Sports",
          page: () => const SportsHeadlinesView(),
        ),
        GetPage(
          binding: TravelHeadlineBinding(),
          name: "/Travel",
          page: () => const TravelHeadlinesView(),
        ),
      ],
      initialRoute: "/HeadLines",
    );
  }
}
