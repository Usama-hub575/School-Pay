import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../../constants/constants.dart';
import '../../../../res/res.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/inkwell_widget.dart';

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
    return InkWellWidget(
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
                fontSize: sizes.fontRatio * 16,
                color: PayNestTheme.lightBlack,
                fontFamily: 'montserratBold',
              ),
            ),
            Spacer(),
            Lottie.asset(
              arrowForwardAnimation,
              repeat: true,
              width: sizes.widthRatio*22,
              height: sizes.heightRatio*22,
            ),
          ],
        ),
      ),
    );
  }
}
