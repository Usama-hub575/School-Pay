import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            'STEP ${widget.currentIndex+1}',
            style: PayNestTheme.h2_12blueAccent.copyWith(
              fontSize: sizes.fontRatio * 13,
              color: PayNestTheme.black,
            ),
          ),
          horizontalSpacer(8),
          widget.currentIndex == 0
              ? Lottie.asset(
                  'assets/json/slider_circle_animation.json',
                  height: sizes.heightRatio * 26,
                  width: sizes.widthRatio * 26,
                  repeat: true,
            alignment: Alignment.center,
                )
              : Container(
                  height: sizes.heightRatio * 16,
                  width: sizes.widthRatio * 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PayNestTheme.colorWhite,
                    border: Border.all(
                      color: PayNestTheme.black.withOpacity(0.5),
                    ),
                  ),
                ),
          Expanded(
            child: Container(
              height: 1,
              color: PayNestTheme.textGrey,
            ),
          ),
          widget.currentIndex == 1
              ? Lottie.asset(
                  'assets/json/slider_circle_animation.json',
                  height: sizes.heightRatio * 26,
                  width: sizes.widthRatio * 26,
                )
              : Container(
                  height: sizes.heightRatio * 16,
                  width: sizes.widthRatio * 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PayNestTheme.colorWhite,
                    border: Border.all(
                      color: PayNestTheme.black.withOpacity(0.5),
                    ),
                  ),
                ),
          Expanded(
            child: Container(
              height: 1,
              color: PayNestTheme.textGrey,
            ),
          ),
          widget.currentIndex == 2
              ? Lottie.asset(
                  'assets/json/slider_circle_animation.json',
                  height: sizes.heightRatio * 26,
                  width: sizes.widthRatio * 26,
                )
              : Container(
                  height: sizes.heightRatio * 16,
                  width: sizes.widthRatio * 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PayNestTheme.colorWhite,
                    border: Border.all(
                      color: PayNestTheme.black.withOpacity(0.5),
                    ),
                  ),
                ),
          // widget.currentIndex == 0
          //     ? Container(
          //   height: sizes.heightRatio * 20,
          //   width: sizes.widthRatio * 20,
          //   child: Lottie.asset(
          //     'assets/json/slider_circle_animation.json',
          //   ),
          // )
          //     : Container(
          //   height: sizes.heightRatio * 20,
          //   width: sizes.widthRatio * 20,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: PayNestTheme.colorWhite,
          //     border: Border.all(
          //       color: PayNestTheme.black.withOpacity(0.5),
          //     ),
          //   ),
          // ),
          // widget.currentIndex == 1
          //     ? Lottie.asset(
          //   'assets/json/slider_circle_animation.json',
          // )
          //     : Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: horizontalValue(6),
          //     vertical: verticalValue(6),
          //   ),
          //   margin: EdgeInsets.only(left: (sizes.width - 110) / 2),
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: PayNestTheme.colorWhite,
          //     border: Border.all(
          //       color: PayNestTheme.black.withOpacity(0.5),
          //     ),
          //   ),
          // ),
          // widget.currentIndex == 2
          //     ? Lottie.asset(
          //   'assets/json/slider_circle_animation.json',
          // )
          //     : Container(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: horizontalValue(6),
          //     vertical: verticalValue(6),
          //   ),
          //   margin: EdgeInsets.only(left: (sizes.width - 110)),
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: PayNestTheme.colorWhite,
          //     border: Border.all(
          //       color: PayNestTheme.black.withOpacity(0.5),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
