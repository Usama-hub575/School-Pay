import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../auth/local_auth_api.dart';
import '../../../../res/res.dart';
import '../../../../theme/theme.dart';
import '../../../../utils/sharedPrefKeys.dart';
import '../../../../utils/sharedpref.dart';
import '../../../../widgets/spacer.dart';

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
  bool isButtonEnable = false;

  @override
  void initState() {
    isButtonEnable = widget.isEnable;
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
            '${widget.value}',
            style: PayNestTheme.h2_12blueAccent.copyWith(
              fontSize: sizes.fontRatio * 14,
              color: PayNestTheme.lightBlack,
              fontFamily: 'montserratBold',
            ),
          ),
          Spacer(),
          Container(
            height: sizes.heightRatio * 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: FittedBox(
              child: CupertinoSwitch(
                thumbColor: PayNestTheme.colorWhite,
                activeColor: Colors.green,
                trackColor: PayNestTheme.colorWhite,
                value: isButtonEnable,
                onChanged: (value){
                  if(value){
                    widget.onTap();
                    setState(() {});
                  }
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
