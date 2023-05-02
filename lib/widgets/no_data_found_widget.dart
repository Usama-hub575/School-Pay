// ignore_for_file: must_be_immutable

import 'package:paynest_flutter_app/export.dart';

class NoDataFound extends StatelessWidget {
  NoDataFound({
    Key? key,
    this.onTap,
    this.showIconButton,
    this.showElevatedButton,
    this.showLogo,
  }) : super(key: key);

  final Function? onTap;
  bool? showIconButton = true;
  bool? showElevatedButton = true;
  bool? showLogo = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes.height,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Column(
        children: [
          verticalSpacer(40),
          Row(
            children: [
              showIconButton == true
                  ? AppBarBackButton(
                      buttonColor: colors.primaryColor,
                      iconColor: colors.white,
                    )
                  : const SizedBox.shrink(),
              const Spacer(),
              showLogo == true
                  ? Image.asset(
                      assets.welcomeRegisterLogo,
                      width: sizes.widthRatio * 120,
                    )
                  : const SizedBox.shrink(),
              const Spacer(),
              horizontalSpacer(24),
            ],
          ),
          const Spacer(),
          Container(
            width: sizes.widthRatio * 150,
            height: sizes.heightRatio * 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  assets.noData,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          verticalSpacer(20),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              noDataText,
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 22,
                color: colors.primaryColor,
              ),
            ),
          ),
          verticalSpacer(10),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              sorryWeCant,
              textAlign: TextAlign.center,
              style: textStyles.bold.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: colors.lightGreyShade,
              ),
            ),
          ),
          const Spacer(),
          showElevatedButton == true
              ? SizedBox(
                  width: double.infinity,
                  height: sizes.heightRatio * 46,
                  child: ElevatedButtons(
                    color: colors.primaryColor,
                    isLoading: false,
                    text: continueTo,
                    textColor: colors.white,
                    onPressed: () {
                      onTap!();
                    },
                  ),
                )
              : const SizedBox.shrink(),
          verticalSpacer(16),
        ],
      ),
    );
  }
}
