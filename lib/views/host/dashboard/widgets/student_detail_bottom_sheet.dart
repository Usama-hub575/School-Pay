import 'package:flutter/material.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/dashboard/widgets/succes_bottom_sheet.dart';
import '../../../../constants/constants.dart';
import '../../../../res/res.dart';
import '../../../../widgets/spacer.dart';
import '../../school/select_school.dart';

class StudentDetailBottomSheet {
  static void show({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StudentWidget();
      },
    );
  }
}

class StudentWidget extends StatefulWidget {
  StudentWidget();

  @override
  State<StudentWidget> createState() => _StudentWidgetState();
}

class _StudentWidgetState extends State<StudentWidget> {
  final TextEditingController _studentCode = TextEditingController();

  @override
  void initState() {
    super.initState();
    _studentCode.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: PayNestTheme.black.withOpacity(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
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
                padding:
                    EdgeInsets.symmetric(horizontal: horizontalValue(30)),
                child: Column(
                  children: [
                    verticalSpacer(48),
                    Text(
                      enterStudentDetail,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                        fontWeight: FontWeight.bold,
                        color: PayNestTheme.primaryColor,
                      ),
                    ),
                    verticalSpacer(22.0),
                    Container(
                      height: sizes.heightRatio * 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: TextFormField(
                        controller: _studentCode,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(
                                0.5,
                              ),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                          ),
                          labelText: enterPaynestStudentCode,
                          labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          SuccessBottomSheet.show(
                            context: context,
                          );
                        },
                        child: Center(
                          child: Text(
                            next,
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
    );
  }
}
