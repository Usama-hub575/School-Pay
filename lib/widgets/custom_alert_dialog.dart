import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../constants/constants.dart';
import '../res/res.dart';

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
            27.r,
          ),
        ),
        title: Container(
          // height: 150.42.h,
          decoration: BoxDecoration(
            // gradient: CustomizedTheme.dialogGreen,
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                27.r,
              ),
            ),
          ),
          child: Column(
            children: [
              verticalSpacer(16),
              SizedBox(
                width: 68.w,
                child: Lottie.asset(
                  checkAnimation,
                )
              )
            ],
          ),
        ),
        titlePadding: const EdgeInsetsDirectional.all(0),
        content: Container(
          height: sizes.heightRatio * 120,
          width: double.infinity,
          child: Column(
            children: [
              verticalSpacer(16),
              Text(title,
                  style: PayNestTheme.h2_14blueAccent.copyWith(
                      color: PayNestTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      fontFamily: 'montserrat')),
              verticalSpacer(8),
              Text(
                message,
                style: PayNestTheme.h2_14blueAccent.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: 'montserrat'),
                textAlign: TextAlign.center,
              ),
              verticalSpacer(16),
              Container(
                width: sizes.widthRatio * 60,
                height: sizes.heightRatio * 26,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: PayNestTheme.primaryColor,
                    elevation: 0,
                    // side: BorderSide(width:1, color:Colors.white),
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
                  child:
                      Text("ok",
                      style: PayNestTheme.subtitle16white.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'montserratBold',
                      ))
                ),
              )
              // OutlinedButton(
              //   onPressed: () {
              //     Navigator.pop(_);
              //     buttonAction.call();
              //   },
              //   style: OutlinedButton.styleFrom(
              //     minimumSize: Size(
              //       0.5.sw,
              //       40.h,
              //     ),
              //     side: BorderSide(
              //       width: 1.0.w,
              //       color: PayNestTheme.primaryColor,
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(
              //           15.r,
              //         ),
              //       ),
              //     ),
              //     backgroundColor: Colors.white,
              //   ),
              //   child: Text(
              //     "Ok",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
