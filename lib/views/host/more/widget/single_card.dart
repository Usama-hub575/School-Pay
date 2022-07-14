import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../../constants/constants.dart';
import '../../../../res/res.dart';
import '../../../../theme/theme.dart';

class SingleCard extends StatelessWidget {
  const SingleCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  final Function onTap;
  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            horizontalSpacer(12),
            Text(
              '$value',
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 14,
                color: PayNestTheme.textGrey,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              arrowNext,
            ),
          ],
        ),
      ),
    );
  }
}
