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
                  AppAssets().checkAnimation,
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
                style: TextStyles().semiBold.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: sizes.fontRatio * 22,
                    ),
              ),
              verticalSpacer(8),
              Text(
                message,
                style: TextStyles().semiBold.copyWith(
                      color: AppColors().black,
                      fontWeight: FontWeight.w400,
                      fontSize: sizes.fontRatio * 14,
                    ),
                textAlign: TextAlign.center,
              ),
              verticalSpacer(16),
              SizedBox(
                width: horizontalValue(60),
                height: verticalValue(26),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors().primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(_);
                    buttonAction.call();
                  },
                  child: Text(
                    ok,
                    style: TextStyles().bold.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          color: AppColors().white,
                        ),
                  ),
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
                color: AppColors().white,
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
                    width: 68,
                    child: Image.asset(
                      AppAssets().icTick,
                      fit: BoxFit.fill,
                      color: AppColors().primaryColor,
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
                      style: TextStyles().bold.copyWith(
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
                        style: TextStyles().regular.copyWith(
                              color: AppColors().black,
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
                      child: OutlinedButton(
                        onPressed: () {
                          updateButtonAction();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(
                            0.5,
                            40,
                          ),
                          side: BorderSide(
                            width: 1.0,
                            color: AppColors().primaryColor,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                15,
                              ),
                            ),
                          ),
                          backgroundColor: AppColors().primaryColor,
                        ),
                        child: Text(
                          update,
                          style: TextStyles().bold.copyWith(
                                fontSize: sizes.fontRatio * 14,
                                color: AppColors().white,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(32),
                      ),
                      child: showCancelButton
                          ? OutlinedButton(
                              onPressed: () {
                                Navigator.pop(_);
                                cancelButtonAction!();
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(
                                  0.5,
                                  40,
                                ),
                                side: BorderSide(
                                  width: 1.0,
                                  color: AppColors().primaryColor,
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      15,
                                    ),
                                  ),
                                ),
                                backgroundColor: AppColors().primaryColor,
                              ),
                              child: Text(
                                cancel,
                                style: TextStyles().bold.copyWith(
                                      fontSize: sizes.fontRatio * 14,
                                      color: AppColors().white,
                                    ),
                              ),
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
