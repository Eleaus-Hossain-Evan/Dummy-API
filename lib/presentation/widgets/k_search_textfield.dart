import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class kSearchTestField extends StatelessWidget {
  const kSearchTestField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.h),
          borderSide:
              BorderSide(color: Theme.of(context).scaffoldBackgroundColor),
        ),
        fillColor: Colors.grey,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
