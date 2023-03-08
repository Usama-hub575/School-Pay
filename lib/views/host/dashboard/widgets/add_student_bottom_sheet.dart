import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/views/host/dashboard/widgets/student_detail_bottom_sheet.dart';

import '../../school/select_school.dart';

class AddStudentBottomSheet {
  static void show({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StudentWidget();
      },
    );
  }
}

class StudentWidget extends StatelessWidget {
  StudentWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: PayNestTheme.black.withOpacity(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IntrinsicHeight(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                color: PayNestTheme.colorWhite,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalValue(30)),
                child: Column(
                  children: [
                    verticalSpacer(35),
                    Text(
                      addStudent,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.black,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(22.0),
                    Lottie.asset(
                      AppAssets().studentJumpingAnimation,
                      repeat: true,
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
                        onPressed: () {
                          Navigator.of(context).pop();
                          StudentDetailBottomSheet.show(
                            context: context,
                          );
                        },
                        child: Center(
                          child: Text(
                            enterThePayNestStudentCode,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: sizes.fontRatio * 12,
                              color: PayNestTheme.colorWhite,
                            ),
                          ),
                        ),
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
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SelectSchool(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            addStudentManually,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
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
    );
  }
}
