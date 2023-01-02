import 'package:clean_api/clean_api.dart';
import 'package:dummy_api/controllers/home_contoller.dart';
import 'package:dummy_api/service/network/network_handler.dart';
import 'package:dummy_api/presentation/styles/k_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constant/strings.dart';
import 'service/network/api.dart';
import 'presentation/screens/home/home_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  final box = await Hive.openBox(KStrings.cacheBox);

  // final api = CleanApi.instance;
  // api.setup(baseUrl: API.baseUrl, showLogs: true);
  // api.setToken(API.appIdHeaders);
  // api.enableCache(box);

  box.put(KStrings.token, '61c74a1797e6fe20b5557de7');

  final myApi = NetworkHandler.instance;
  myApi.setup(
      baseUrl: API.baseUrl, showLogs: true, customeTokenField: 'app-id');
  myApi.setToken(box.get(KStrings.token, defaultValue: ''));
  myApi.enableCache(box);

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
