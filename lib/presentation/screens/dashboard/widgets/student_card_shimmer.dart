import 'package:paynest_flutter_app/export.dart';

class ShimmerStudentCard extends StatelessWidget {
  const ShimmerStudentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeShimmer(
      width: sizes.widthRatio * 100,
      height: sizes.heightRatio * 150,
      baseColor: const Color(0xFFEBEBF4),
      highlightColor: const Color(0xFFF4F4F4),
      radius: 18,
    );
  }
}
