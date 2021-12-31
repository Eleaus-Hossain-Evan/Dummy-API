import 'package:dummy_api/controllers/home_contoller.dart';
import 'package:dummy_api/size_config.dart';
import 'package:dummy_api/views/screens/home/widgets/post_list.dart';
import 'package:dummy_api/views/styles/colors.dart';
import 'package:dummy_api/views/styles/styles.dart';
import 'package:dummy_api/views/widgets/k_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  // Future<List<PostList>> _posts = [] as Future<List<PostList>>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: customWidth(10),
            ),
            _dummyText(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: customWidth(18)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/svg/camera.svg",
                    height: customWidth(20),
                    width: customWidth(20),
                    fit: BoxFit.scaleDown,
                    color: KColor.primaryColor,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: customWidth(5)),
                    width: 200,
                    child: const kSearchTestField(),
                  ),
                ],
              ),
            ),
            PostListWidget(),
          ],
        ),
      ),
    );
  }

  Padding _dummyText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: customWidth(18)),
      child: SizedBox(
        height: customWidth(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "DUMMY API",
                  style: KThemeData.headingBoldText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
