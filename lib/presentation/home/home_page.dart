import 'package:bot_toast/bot_toast.dart';
import 'package:dummy_api/application/home_provider.dart';
import 'package:dummy_api/presentation/widgets/k_search_textfield.dart';
import 'package:dummy_api/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/post_list.dart';

class HomeScreen extends HookConsumerWidget {
  static String route = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  // Future<List<PostList>> _posts = [] as Future<List<PostList>>;

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(homeProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        BotToast.showLoading();
      } else {
        BotToast.closeAllLoading();
      }
    });
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
                    color: CustomColor.primary,
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
