import 'package:paynest_flutter_app/export.dart';

class AddStudentBottomSheet {
  static void show({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
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
                borderRadius: const BorderRadius.only(
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
                    SizedBox(
                      width: double.infinity,
                      height: sizes.heightRatio * 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PayNestTheme.primaryColor,
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
                    SizedBox(
                      width: double.infinity,
                      height: sizes.heightRatio * 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PayNestTheme.primaryColor,
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
