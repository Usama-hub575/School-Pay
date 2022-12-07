import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';

import '../../../../res/res.dart';
import '../../../../widgets/spacer.dart';

class DashboardShimmerCard extends StatelessWidget {
  const DashboardShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: horizontalValue(16),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalValue(16),
            vertical: verticalValue(12),
          ),
          child: FadeShimmer(
            width: sizes.widthRatio * 20,
            height: sizes.heightRatio * 20,
            fadeTheme: FadeTheme.dark,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return horizontalSpacer(10);
      },
      itemCount: 3,
    );
  }
}
