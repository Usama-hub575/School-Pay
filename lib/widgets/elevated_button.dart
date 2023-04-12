import 'package:paynest_flutter_app/export.dart';

class ElevatedButtons extends StatelessWidget {
  const ElevatedButtons({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.isLoading,
  }) : super(key: key);
  final Color color;
  final Color textColor;
  final String text;
  final Function onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalValue(7),
          horizontal: horizontalValue(10),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: colors.white,
                  color: colors.blueAccent,
                ),
              )
            : Text(
                text,
                style: textStyles.bold.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: sizes.fontRatio * 14,
                ),
              ),
      ),
    );
  }
}
