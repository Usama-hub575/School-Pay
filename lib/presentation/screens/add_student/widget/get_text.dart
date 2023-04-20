import 'package:paynest_flutter_app/export.dart';

class GetText extends StatelessWidget {
  final int length;
  const GetText({
    super.key,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(36),
      ),
      child: Row(
        children: [
          Text(
            searchResult,
            style: textStyles.bold.copyWith(
              fontSize: sizes.fontRatio * 16,
              color: colors.black,
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.primaryColor,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(10),
              vertical: verticalValue(10),
            ),
            child: Text(
              '$length',
              style: textStyles.semiBold.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: colors.white,
              ),
            ),
          ),
          horizontalSpacer(16),
        ],
      ),
    );
  }
}
