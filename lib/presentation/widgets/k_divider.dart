import 'package:dummy_api/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class KDivider extends StatelessWidget {
  const KDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: KColor.secendaryColor.withOpacity(.4),
      thickness: 1.6,
    );
  }
}
