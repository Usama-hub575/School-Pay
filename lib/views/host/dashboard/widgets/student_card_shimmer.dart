import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';

import '../../../../res/res.dart';

class StudentCardShimmer extends StatelessWidget {
  const StudentCardShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeShimmer(
      width: sizes.widthRatio * 100,
      height: sizes.heightRatio * 150,
      baseColor: Color(0xFFEBEBF4),
      highlightColor: Color(0xFFF4F4F4),
      radius: 18,
    );
  }
}