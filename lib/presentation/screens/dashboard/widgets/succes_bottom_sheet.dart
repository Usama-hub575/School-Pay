import 'package:get/get.dart';
import 'package:paynest_flutter_app/export.dart';

import '../../../../controller/myStudent_controller.dart';

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
  SuccessWidget({super.key});

  final MyStudentController myStudentController =
      Get.put(MyStudentController());
  final UserController lc = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: colors.black.withOpacity(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  color: colors.white,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalValue(30)),
                  child: Column(
                    children: [
                      verticalSpacer(24),
                      Text(
                        studentAdded,
                        style: textStyles.bold.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colors.primaryColor,
                          fontSize: sizes.fontRatio * 16,
                        ),
                      ),
                      verticalSpacer(16),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: colors.textGrey.withOpacity(0.5),
                      ),
                      verticalSpacer(16),
                      Lottie.asset(
                        assets.checkAnimation,
                        repeat: true,
                        height: sizes.heightRatio * 100,
                        width: sizes.widthRatio * 100,
                      ),
                      Text(
                        successfully,
                        style: textStyles.bold.copyWith(
                          fontSize: sizes.fontRatio * 16,
                          color: colors.primaryColor,
                        ),
                      ),
                      Text(
                        studentAddedSuccessfully,
                        style: textStyles.regular.copyWith(
                          fontWeight: FontWeight.w200,
                          fontSize: sizes.fontRatio * 12,
                          color: colors.black.withOpacity(0.7),
                        ),
                      ),
                      verticalSpacer(22.0),
                      SizedBox(
                        width: double.infinity,
                        height: sizes.heightRatio * 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primaryColor,
                            elevation: 0,
                            // side: BorderSide(width:1, color:Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.navigateToDashboard,
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Center(
                            child: Text(
                              takeToHome,
                              style: textStyles.bold.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: colors.white,
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
