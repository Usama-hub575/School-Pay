import 'package:paynest_flutter_app/export.dart';

Widget optionalButton({
  required Color buttonColor,
  required Function onTap,
  required String value,
}) {
  return InkWellWidget(
    onTap: () {
      onTap();
    },
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(40),
        vertical: verticalValue(16),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            style: textStyles.bold.copyWith(
              color: colors.white,
              fontSize: sizes.fontRatio * 14,
            ),
          ),
          Text(
            'OPTIONAL',
            textAlign: TextAlign.center,
            style: textStyles.medium.copyWith(
              fontSize: sizes.fontRatio * 10,
              color: colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
