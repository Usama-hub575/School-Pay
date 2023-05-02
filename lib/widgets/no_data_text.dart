import 'package:paynest_flutter_app/export.dart';

class NoDataText extends StatelessWidget {
  const NoDataText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        noDataText,
        style: textStyles.bold.copyWith(
          fontSize: sizes.fontRatio * 22,
          color: colors.primaryColor,
        ),
      ),
    );
  }
}
