import 'package:dummy_api/controllers/home_contoller.dart';
import 'package:dummy_api/models/post_model.dart';
import 'package:dummy_api/size_config.dart';
import 'package:dummy_api/views/styles/k_text_theme.dart';
import 'package:dummy_api/views/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: customWidth(18)),
              child: SizedBox(
                height: customWidth(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: customWidth(20),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "DUMMY API",
                          style: KThemeData.headingBoldText,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/svg/camera.svg",
                      height: customWidth(20),
                      width: customWidth(20),
                      fit: BoxFit.scaleDown,
                      color: KThemeData.primaryColor,
                    )
                  ],
                ),
              ),
            ),
            const Center(
              child: Text(
                "home",
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  if (_homeController.isLoading.isTrue) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _homeController.postList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: customWidth(18)),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      _homeController
                                          .postList[index].owner.picture,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: customWidth(4)),
                                    child: Column(
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text:
                                                "${_homeController.postList[index].owner.title}. ",
                                            children: [
                                              TextSpan(
                                                  text:
                                                      "${_homeController.postList[index].owner.firstName} "),
                                              TextSpan(
                                                  text: _homeController
                                                      .postList[index]
                                                      .owner
                                                      .lastName)
                                            ],
                                          ),
                                        ),
                                        Text(DateFormat(
                                                "MMM d, yy \u00B7 h:mm a")
                                            .format(_homeController
                                                .postList[index].publishDate))
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.more_horiz_rounded,
                                    color: KThemeData.secendaryColor,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: customWidth(18),
                                left: customWidth(18),
                                top: customWidth(5),
                              ),
                              child: Wrap(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      _homeController.postList[index].text,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: customWidth(10),
                              ),
                              height: customWidth(250),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    _homeController.postList[index].image
                                        .toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: customWidth(18),
                                    vertical: customWidth(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.thumb_up_alt_rounded,
                                        color: KThemeData.primaryColor,
                                      ),
                                      Text(
                                        _homeController.postList[index].likes
                                            .toString(),
                                        style:
                                            KTextTheme.nameTextStyle.copyWith(
                                          fontWeight: FontWeight.w200,
                                          fontSize: customWidth(12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Wrap(
                                    alignment: WrapAlignment.end,
                                    runAlignment: WrapAlignment.end,
                                    crossAxisAlignment: WrapCrossAlignment.end,
                                    children: [
                                      ...List.generate(
                                        _homeController
                                            .postList[index].tags.length,
                                        (i) => Container(
                                          margin: EdgeInsets.all(
                                            customWidth(5),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: customWidth(5),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              border: Border.all(
                                                color:
                                                    KThemeData.secendaryColor,
                                              )),
                                          child: Text(
                                            _homeController
                                                .postList[index].tags[i],
                                            style: KTextTheme.tagTextStyle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: customWidth(20),
                              ),
                              child: const Divider(
                                color: KThemeData.secendaryColor,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
