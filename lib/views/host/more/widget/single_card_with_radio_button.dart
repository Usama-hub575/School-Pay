import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../res/res.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/spacer.dart';

class SingleCardWithRadioButton extends StatefulWidget {
  const SingleCardWithRadioButton({
    Key? key,
    required this.onTap,
    required this.value,
    required this.icon,
  }) : super(key: key);

  final Function onTap;
  final String icon;
  final String value;

  @override
  State<SingleCardWithRadioButton> createState() =>
      _SingleCardWithRadioButtonState();
}

class _SingleCardWithRadioButtonState extends State<SingleCardWithRadioButton> {
  bool isEnable = false;

  @override
  void initState() {
    super.initState();
    isEnable = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(widget.icon),
            horizontalSpacer(12),
            Text(
              '${widget.value}',
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 14,
                color: PayNestTheme.textGrey,
              ),
            ),
            Spacer(),
            Container(
              height: sizes.heightRatio * 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: FittedBox(
                child: CupertinoSwitch(
                  thumbColor: PayNestTheme.colorWhite,
                  activeColor: Colors.green,
                  trackColor: PayNestTheme.colorWhite,
                  value: isEnable,
                  onChanged: (value) async {
                    isEnable = !isEnable;
                    setState(() {});
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
