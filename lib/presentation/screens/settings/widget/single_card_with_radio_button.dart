import 'package:flutter/cupertino.dart';
import 'package:paynest_flutter_app/export.dart';

class SingleCardWithRadioButton extends StatefulWidget {
  const SingleCardWithRadioButton({
    Key? key,
    required this.onTap,
    required this.value,
    required this.icon,
    required this.isEnable,
  }) : super(key: key);

  final Function onTap;
  final String icon;
  final String value;
  final bool isEnable;

  @override
  State<SingleCardWithRadioButton> createState() =>
      _SingleCardWithRadioButtonState();
}

class _SingleCardWithRadioButtonState extends State<SingleCardWithRadioButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(widget.icon),
          horizontalSpacer(12),
          Text(
            widget.value,
            style: textStyles.bold.copyWith(
              fontSize: sizes.fontRatio * 16,
              color: colors.lightGreyShade,
            ),
          ),
          const Spacer(),
          Container(
            height: sizes.heightRatio * 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: FittedBox(
              child: CupertinoSwitch(
                  thumbColor: colors.white,
                  activeColor: colors.green2,
                  trackColor: colors.white,
                  value: widget.isEnable,
                  onChanged: (value) {
                    widget.onTap(value);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
