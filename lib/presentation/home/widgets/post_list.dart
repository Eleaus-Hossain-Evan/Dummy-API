import 'package:dummy_api/presentation/widgets/k_divider.dart';
import 'package:dummy_api/utils/custom_color.dart';
import 'package:dummy_api/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:intl/intl.dart';

import '../../../application/home_provider.dart';

class PostListWidget extends HookConsumerWidget {
  const PostListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: state.posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      state.posts[index].owner.picture,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "${state.posts[index].owner.title}. ",
                            children: [
                              TextSpan(
                                  text:
                                      "${state.posts[index].owner.firstName} "),
                              TextSpan(text: state.posts[index].owner.lastName)
                            ],
                          ),
                        ),
                        Text(DateFormat("MMM d, yy \u00B7 h:mm a")
                            .format(state.posts[index].publishDate))
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
                      color: CustomColor.secondary.withOpacity(.4),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 5.h),
              child: Wrap(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.posts[index].text,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10.w,
              ),
              height: 250.w,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    state.posts[index].image.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 5.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.thumb_up_alt_rounded,
                        color: CustomColor.primary,
                      ),
                      Text(
                        state.posts[index].likes.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12.sp,
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
                        state.posts[index].tags.length,
                        (i) => Container(
                          margin: EdgeInsets.all(5.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                color: CustomColor.primary,
                              )),
                          child: Text(
                            state.posts[index].tags[i],
                            style: CustomStyle.tagTextStyle,
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
                horizontal: 20.w,
              ),
              child: const KDivider(),
            ),
          ],
        );
      },
    ));
  }
}
