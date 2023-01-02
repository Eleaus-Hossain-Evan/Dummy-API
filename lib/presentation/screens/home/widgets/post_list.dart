import 'package:dummy_api/controllers/home_contoller.dart';
import 'package:dummy_api/presentation/styles/colors.dart';
import 'package:dummy_api/presentation/styles/k_text_theme.dart';
import 'package:dummy_api/presentation/styles/styles.dart';
import 'package:dummy_api/presentation/widgets/k_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../size_config.dart';

class PostListWidget extends StatelessWidget {
  PostListWidget({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: customWidth(18)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              _homeController.postList[index].owner.picture,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: customWidth(4)),
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
                                              .postList[index].owner.lastName)
                                    ],
                                  ),
                                ),
                                Text(DateFormat("MMM d, yy \u00B7 h:mm a")
                                    .format(_homeController
                                        .postList[index].publishDate))
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.grey.withOpacity(.6),
                                )),
                            child: Icon(
                              Icons.more_horiz_rounded,
                              color: KColor.secendaryColor.withOpacity(.4),
                            ),
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
                            _homeController.postList[index].image.toString(),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.thumb_up_alt_rounded,
                                color: KColor.primaryColor,
                              ),
                              Text(
                                _homeController.postList[index].likes
                                    .toString(),
                                style: KTextTheme.nameTextStyle.copyWith(
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
                                _homeController.postList[index].tags.length,
                                (i) => Container(
                                  margin: EdgeInsets.all(
                                    customWidth(5),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: customWidth(5),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                        color: KColor.primaryColor,
                                      )),
                                  child: Text(
                                    _homeController.postList[index].tags[i],
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
                      child: KDivider(),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
