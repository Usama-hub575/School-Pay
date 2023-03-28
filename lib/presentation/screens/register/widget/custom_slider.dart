import 'package:paynest_flutter_app/export.dart';

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
    return Row(
      children: [
        Text(
          'STEP ${widget.currentIndex + 1}',
          style: TextStyles().bold.copyWith(
                color: AppColors().black,
                fontSize: sizes.fontRatio * 16,
              ),
        ),
        horizontalSpacer(8),
        widget.currentIndex == 0
            ? Lottie.asset(
                AppAssets().sliderCircleAnimation,
                height: sizes.heightRatio * 26,
                width: sizes.widthRatio * 26,
              )
            : Container(
                height: sizes.heightRatio * 16,
                width: sizes.widthRatio * 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors().white,
                  border: Border.all(
                    color: AppColors().black.withOpacity(0.5),
                  ),
                ),
              ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors().textGrey,
          ),
        ),
        widget.currentIndex == 1
            ? Lottie.asset(
                AppAssets().sliderCircleAnimation,
                height: sizes.heightRatio * 26,
                width: sizes.widthRatio * 26,
              )
            : Container(
                height: sizes.heightRatio * 16,
                width: sizes.widthRatio * 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors().white,
                  border: Border.all(
                    color: AppColors().black.withOpacity(0.5),
                  ),
                ),
              ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors().textGrey,
          ),
        ),
        widget.currentIndex == 2
            ? Lottie.asset(
                AppAssets().sliderCircleAnimation,
                height: sizes.heightRatio * 26,
                width: sizes.widthRatio * 26,
              )
            : Container(
                height: sizes.heightRatio * 16,
                width: sizes.widthRatio * 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors().white,
                  border: Border.all(
                    color: AppColors().black.withOpacity(0.5),
                  ),
                ),
              ),
      ],
    );
  }
}
