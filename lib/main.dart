import 'package:dummy_api/controllers/home_contoller.dart';
import 'package:dummy_api/views/styles/k_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.put(HomeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: KThemeData.mainTheme,
      home: HomePage(),
    );
  }
}
