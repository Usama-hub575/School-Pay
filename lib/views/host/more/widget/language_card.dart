import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

import '../../../../constants/constants.dart';
import '../../../../res/res.dart';
import '../../../../widgets/spacer.dart';

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
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.language,
              color: PayNestTheme.primaryColor,
            ),
            horizontalSpacer(12),
            Text(
              language,
              style: PayNestTheme.title_3_16white.copyWith(
                fontSize: sizes.fontRatio * 14,
                fontWeight: FontWeight.w700,
                color: PayNestTheme.textGrey,
              ),
            ),
            const Spacer(),
            FlutterToggleTab(
              width: 22,
              height: sizes.heightRatio * 18,
              borderRadius: 15,
              selectedBackgroundColors: [
                PayNestTheme.colorWhite,
              ],
              unSelectedBackgroundColors: [
                PayNestTheme.primaryColor,
              ],
              selectedTextStyle:
                  PayNestTheme.title_3_16white.copyWith(
                fontSize: sizes.fontRatio * 14,
                fontWeight: FontWeight.w700,
                color: PayNestTheme.primaryColor,
              ),
              unSelectedTextStyle: PayNestTheme.title_3_16white.copyWith(
                fontSize: sizes.fontRatio * 14,
                fontWeight: FontWeight.w700,
                color: PayNestTheme.colorWhite,
              ),
              labels: [
                'En',
                'Ar'
              ],
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
