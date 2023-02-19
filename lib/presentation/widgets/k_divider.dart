import 'package:dummy_api/utils/custom_color.dart';
import 'package:flutter/material.dart';

class KDivider extends StatelessWidget {
  const KDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: CustomColor.secondary.withOpacity(.4),
      thickness: 1.6,
    );
  }
}
