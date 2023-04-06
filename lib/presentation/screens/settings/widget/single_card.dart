import 'package:paynest_flutter_app/export.dart';

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
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            horizontalSpacer(12),
            Text(
              value,
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: colors.lightGreyShade,
              ),
            ),
            const Spacer(),
            Lottie.asset(
              assets.arrowForwardAnimation,
              repeat: true,
              width: sizes.widthRatio * 22,
              height: sizes.heightRatio * 22,
            ),
          ],
        ),
      ),
    );
  }
}
