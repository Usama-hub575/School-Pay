import 'package:paynest_flutter_app/export.dart';

class CustomAlertDialog {
  static baseDialog({
    required BuildContext context,
    required String title,
    required String message,
    required Function buttonAction,
    bool showCrossIcon = true,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      useSafeArea: true,
      builder: (_) => AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            27,
          ),
        ),
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                27,
              ),
            ),
          ),
          child: Column(
            children: [
              verticalSpacer(16),
              SizedBox(
                width: horizontalValue(68),
                child: Lottie.asset(
                  assets.checkAnimation,
                ),
              ),
            ],
          ),
        ),
        titlePadding: const EdgeInsetsDirectional.all(0),
        content: SizedBox(
          height: sizes.heightRatio * 120,
          width: double.infinity,
          child: Column(
            children: [
              verticalSpacer(16),
              Text(
                title,
                style: textStyles.semiBold.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: sizes.fontRatio * 22,
                ),
              ),
              verticalSpacer(8),
              Text(
                message,
                style: textStyles.semiBold.copyWith(
                  color: colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: sizes.fontRatio * 14,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpacer(10),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalValue(32),
                ),
                child: ElevatedButtons(
                  color: colors.primaryColor,
                  textColor: colors.white,
                  text: ok,
                  isLoading: false,
                  onPressed: () async {
                    buttonAction();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static appUpdateDialog({
    required BuildContext context,
    required String title,
    required String message,
    required int locale,
    required Function updateButtonAction,
    Function? cancelButtonAction,
    required bool showCancelButton,
    bool showCrossIcon = true,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      useSafeArea: true,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: horizontalValue(32),
          ),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                27,
              ),
            ),
            title: Container(
              decoration: BoxDecoration(
                color: colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    27,
                  ),
                ),
              ),
              child: Column(
                children: [
                  verticalSpacer(16),
                  SizedBox(
                    width: horizontalValue(68),
                    child: Image.asset(
                      assets.icTick,
                      fit: BoxFit.fill,
                      color: colors.primaryColor,
                    ),
                    // child: Assets.png.icTick.image(
                    //   fit: BoxFit.fill,
                    //   color: ColorName.primaryColor,
                    // ),
                  )
                ],
              ),
            ),
            titlePadding: const EdgeInsetsDirectional.all(0),
            content: IntrinsicHeight(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    verticalSpacer(16),
                    Text(
                      title,
                      style: textStyles.bold.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: sizes.fontRatio * 22,
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(32),
                      ),
                      child: Text(
                        message,
                        style: textStyles.regular.copyWith(
                          color: colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: sizes.fontRatio * 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(32),
                      ),
                      child: ElevatedButtons(
                        isLoading: false,
                        text: update,
                        textColor: colors.white,
                        color: colors.primaryColor,
                        onPressed: () {
                          updateButtonAction();
                        },
                        showIcon: false,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(32),
                      ),
                      child: showCancelButton
                          ? ElevatedButtons(
                              onPressed: () {
                                Navigator.pop(_);
                                cancelButtonAction!();
                              },
                              color: colors.primaryColor,
                              textColor: colors.white,
                              text: cancel,
                              isLoading: false,
                            )
                          : const SizedBox(),
                    ),
                    verticalSpacer(10)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
