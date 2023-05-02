import 'package:paynest_flutter_app/export.dart';

class CommercialImage extends StatelessWidget {
  const CommercialImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes.heightRatio * 41,
      width: sizes.widthRatio * 41,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
