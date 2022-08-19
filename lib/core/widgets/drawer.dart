import 'package:flutter/material.dart';
import 'package:get/get.dart';

getAppDrawer() {
  return Drawer(
      backgroundColor: Colors.blue.shade900,
      child: ListView(
        children: [
          Image.asset("assets/logo/News Logo.png"),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.newspaper_outlined),
            title: const Text(
              "LATEST HEADLINES",
            ),
            onTap: () {
              Get.toNamed("HeadLines");
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.search_outlined),
            title: const Text("SEARCH NEWS"),
            onTap: () {
              Get.toNamed("SearchNews");
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.business_center_outlined),
            title: const Text("BUSINESS"),
            onTap: () {
              Get.toNamed("Business");
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.coronavirus_outlined),
            title: const Text("COVID-19"),
            onTap: () {
              Get.toNamed("COVID");
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.tv_sharp),
            title: const Text("ENTERTAINMENT"),
            onTap: () {
              Get.toNamed("Entertainment");
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.health_and_safety_outlined),
            title: const Text("HEALTH"),
            onTap: () {
              Get.toNamed("Health");
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.sports_baseball_outlined),
            title: const Text("SPORTS"),
            onTap: () {
              Get.toNamed("Sports");
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.food_bank_outlined),
            title: const Text("FOOD"),
            onTap: () {
              Get.toNamed("Food");
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.person_outline),
            title: const Text("FASHION"),
            onTap: () {
              Get.toNamed("Fashion");
            },
          ),
          ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.travel_explore_outlined),
            title: const Text("TRAVEL"),
            onTap: () {
              Get.toNamed("Travel");
            },
          ),
          const SizedBox(
            height: 50,
          ),
          const Divider(
            color: Colors.white,
          ),
          const Center(
              child: Text(
            "V1.01",
            style: TextStyle(color: Colors.white),
          ))
        ],
      ));
}
