import 'package:paynest_flutter_app/export.dart';

void showToast(
    {required String messege,
    required BuildContext context,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: color,
      padding: EdgeInsets.symmetric(
        vertical: verticalValue(16),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Text(
        messege,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
