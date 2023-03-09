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
    // return BlocBuilder<SignInBloc, SignInState>(
    //   builder: (context, state) {
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
          vertical: verticalValue(8),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors().white,
                  color: AppColors().blueAccent,
                ),
              )
            : Text(
                text,
                style: TextStyles().semiBold.copyWith(
                      color: textColor,
                      fontSize: sizes.fontRatio * 14,
                    ),
              ),
      ),
    );
  }
}
