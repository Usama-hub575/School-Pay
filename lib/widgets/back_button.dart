import 'package:paynest_flutter_app/export.dart';

class AppBarBackButton extends StatefulWidget {
  final Color buttonColor;
  final Color iconColor;

  const AppBarBackButton({
    Key? key,
    required this.buttonColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  State<AppBarBackButton> createState() => _AppBarBackButtonState();
}

class _AppBarBackButtonState extends State<AppBarBackButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: horizontalValue(25),
      ),
      child: Container(
        height: verticalValue(46),
        width: horizontalValue(46),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 1.0,
              offset: Offset(
                1.3, // Move to right 10  horizontally
                1.3, // Move to bottom 10 Vertically
              ),
            ),
          ],
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: widget.iconColor,
            shadows: [
              Shadow(
                color: colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
