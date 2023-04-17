import 'package:paynest_flutter_app/export.dart';

class OtherImage extends StatelessWidget {
  const OtherImage({
    Key? key,
    required this.imagePath,
    required this.opacity,
  }) : super(key: key);

  final String imagePath;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        height: sizes.heightRatio * 26,
        width: sizes.widthRatio * 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
