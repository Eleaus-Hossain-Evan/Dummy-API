import 'package:dummy_api/presentation/styles/colors.dart';
import 'package:dummy_api/presentation/widgets/k_search_textfield.dart';
import 'package:dummy_api/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/post_list.dart';

class HomeScreen extends StatelessWidget {
  static String route = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  // Future<List<PostList>> _posts = [] as Future<List<PostList>>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            _dummyText(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/svg/camera.svg",
                    height: 20.h,
                    width: 20.h,
                    fit: BoxFit.scaleDown,
                    color: KColor.primaryColor,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                    width: 200,
                    child: const kSearchTestField(),
                  ),
                ],
              ),
            ),
            const PostListWidget(),
          ],
        ),
      ),
    );
  }

  Padding _dummyText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: SizedBox(
        height: 40.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "DUMMY API",
                  style: CustomStyle.headingBoldText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
