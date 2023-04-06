import 'package:paynest_flutter_app/export.dart';

class TransactionShimmerCard extends StatelessWidget {
  const TransactionShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: horizontalValue(16),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalValue(16),
            vertical: verticalValue(12),
          ),
          child: FadeShimmer(
            width: sizes.widthRatio * 150,
            height: sizes.heightRatio * 50,
            // fadeTheme: FadeTheme.dark,
            baseColor: const Color(0xFFEBEBF4),
            highlightColor: const Color(0xFFF4F4F4),
            radius: 16,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return verticalSpacer(6);
      },
      itemCount: 2,
    );
  }
}
