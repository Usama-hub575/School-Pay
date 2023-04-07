import 'package:paynest_flutter_app/export.dart';

class AddStudentBottomSheet {
  static void show({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: colors.transparent,
      builder: (context) {
        return const AddStudentWidget();
      },
    );
  }
}

class AddStudentWidget extends StatelessWidget {
  const AddStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: colors.black.withOpacity(0),
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                color: colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(30),
                ),
                child: Column(
                  children: [
                    verticalSpacer(35),
                    Text(
                      addStudent,
                      style: textStyles.bold.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: colors.black,
                      ),
                    ),
                    verticalSpacer(22.0),
                    Lottie.asset(
                      assets.studentJumpingAnimation,
                      repeat: true,
                    ),
                    verticalSpacer(22.0),
                    SizedBox(
                      width: double.infinity,
                      height: sizes.heightRatio * 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primaryColor,
                          elevation: 0,
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
                            style: textStyles.bold.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: sizes.fontRatio * 12,
                              color: colors.white,
                            ),
                          ),
                        ),
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
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const SelectSchool(),
                          //   ),
                          // );
                        },
                        child: Center(
                          child: Text(
                            addStudentManually,
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
    );
  }
}
