import 'package:paynest_flutter_app/export.dart';

class SchoolContainer extends StatelessWidget {
  const SchoolContainer({
    super.key,
    required this.selectedSchoolData,
  });

  final SelectedSchoolData selectedSchoolData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      padding: EdgeInsets.symmetric(
        vertical: verticalValue(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            assets.schoolCampusAnimation,
            repeat: true,
            width: sizes.widthRatio * 172,
            height: sizes.heightRatio * 96,
            fit: BoxFit.fill,
          ),
          Text(
            selectedSchoolData.name,
            textAlign: TextAlign.center,
            style: textStyles.bold.copyWith(
              fontSize: sizes.fontRatio * 22,
              color: colors.black,
            ),
          ),
          verticalSpacer(6),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
            ),
            child: Text(
              selectedSchoolData.address,
              textAlign: TextAlign.center,
              style: textStyles.regular.copyWith(
                color: colors.textGrey,
                fontSize: sizes.fontRatio * 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
