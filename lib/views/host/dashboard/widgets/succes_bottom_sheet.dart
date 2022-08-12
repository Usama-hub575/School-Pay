import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import '../../../../constants/constants.dart';
import '../../../../controller/myStudent_controller.dart';
import '../../../../controller/user_controller.dart';
import '../../../../res/res.dart';
import '../../../../widgets/spacer.dart';
import '../../school/select_school.dart';

class SuccessBottomSheet {
  static void show({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SuccessWidget();
      },
    );
  }
}

class SuccessWidget extends StatelessWidget {
  SuccessWidget();
  final MyStudentController myStudentController =
  Get.put(MyStudentController());
  final UserController lc = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: PayNestTheme.black.withOpacity(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  color: PayNestTheme.colorWhite,
                ),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: horizontalValue(30)),
                  child: Column(
                    children: [
                      verticalSpacer(24),
                      Text(
                        studentAdded,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontWeight: FontWeight.bold,
                          color: PayNestTheme.primaryColor,
                        ),
                      ),
                      verticalSpacer(16),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: PayNestTheme.textGrey.withOpacity(0.5),
                      ),
                      verticalSpacer(16),
                      Lottie.asset(
                        checkAnimation,
                        repeat: true,
                        height: sizes.heightRatio*100,
                        width: sizes.widthRatio*100,
                      ),
                      Text(
                        successfully,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: sizes.fontRatio*16,
                          color: PayNestTheme.primaryColor,
                        ),
                      ),
                      Text(
                        studentAddedSuccessfully,
                        style: PayNestTheme.small_2_12black.copyWith(
                          fontWeight: FontWeight.w200,
                          fontSize: sizes.fontRatio*12,
                          color: PayNestTheme.black.withOpacity(0.7),
                        ),
                      ),
                      verticalSpacer(22.0),
                      Container(
                        width: double.infinity,
                        height: sizes.heightRatio * 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PayNestTheme.primaryColor,
                            elevation: 0,
                            // side: BorderSide(width:1, color:Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await myStudentController.hitMyStudents(
                              lc.userResData.value.parent!.id,
                            );
                          },
                          child: Center(
                            child: Text(
                              backToHome,
                              style:
                              PayNestTheme.title_2_16primaryColor.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: PayNestTheme.colorWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                      verticalSpacer(22.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
