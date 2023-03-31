import 'package:paynest_flutter_app/export.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(20),
        vertical: verticalValue(14),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: colors.primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          horizontalSpacer(8),
          Text(
            text,
            style: textStyles.bold.copyWith(
              fontSize: sizes.fontRatio * 16,
              color: colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
