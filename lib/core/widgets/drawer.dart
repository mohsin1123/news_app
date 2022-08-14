import 'package:flutter/material.dart';
import 'package:get/get.dart';

getAppDrawer() {
  return Drawer(
      child: ListView(
    children: [
      ListTile(
        leading: const Icon(Icons.newspaper_outlined),
        title: const Text("News Headline"),
        onTap: () {
          Get.toNamed("HeadLines");
        },
      ),
      ListTile(
        leading: const Icon(Icons.search_outlined),
        title: const Text("Search News"),
        onTap: () {
          Get.toNamed("SearchNews");
        },
      )
    ],
  ));
}
