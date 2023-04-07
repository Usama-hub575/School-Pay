import 'package:paynest_flutter_app/export.dart';

class LanguageCard extends StatefulWidget {
  const LanguageCard({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWellWidget(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(assets.icLanguage),
            horizontalSpacer(12),
            Text(
              language,
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 14,
                color: colors.lightGreyShade,
              ),
            ),
            const Spacer(),
            FlutterToggleTab(
              width: 22,
              height: sizes.heightRatio * 18,
              borderRadius: 15,
              selectedBackgroundColors: [
                colors.white,
              ],
              unSelectedBackgroundColors: [
                colors.primaryColor,
              ],
              selectedTextStyle: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 14,
                fontWeight: FontWeight.w700,
                color: colors.primaryColor,
              ),
              unSelectedTextStyle: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 14,
                fontWeight: FontWeight.w700,
                color: colors.white,
              ),
              labels: const ['En', 'Ar'],
              selectedLabelIndex: (index) {
                selectedIndex = index;
                setState(() {});
              },
              selectedIndex: selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
