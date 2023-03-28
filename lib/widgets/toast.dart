import 'package:paynest_flutter_app/export.dart';

void showToast({
  required String message,
  required BuildContext context,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: color,
      padding: EdgeInsets.symmetric(
        vertical: verticalValue(16),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: sizes.fontRatio * 16,
            color: AppColors().white,
            fontFamily: "montserratRegular",
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
