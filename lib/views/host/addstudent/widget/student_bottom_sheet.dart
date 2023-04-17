import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

import '../../../../constants/constants.dart';
import '../../../../presentation/res/res.dart';
import '../../../../widgets/inkwell_widget.dart';
import '../../../../widgets/spacer.dart';

class StudentBottomSheet {
  static void show({
    required BuildContext context,
    required String selectedStudentID,
    required String selectedStudentRegNo,
    required Function(String studentId, String parentId, String studentDOB)
        onTap,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StudentWidget(
          selectedStudentID: selectedStudentID,
          selectedStudentRegNo: selectedStudentRegNo,
          onTap: (studentId, parentId, studentDOB) => onTap(
            studentId,
            parentId,
            studentDOB,
          ),
        );
      },
    );
  }
}

class StudentWidget extends StatefulWidget {
  final String selectedStudentID;
  final String selectedStudentRegNo;
  final Function(String studentId, String parentId, String studentDOB) onTap;

  StudentWidget({
    required this.selectedStudentID,
    required this.selectedStudentRegNo,
    required this.onTap,
  });

  @override
  State<StudentWidget> createState() => _StudentWidgetState();
}

class _StudentWidgetState extends State<StudentWidget> {
  TextEditingController _studentId = TextEditingController();
  TextEditingController _parentId = TextEditingController();
  TextEditingController _dob = TextEditingController();
  DateTime tempPickedDate = DateTime.now();

  List<String> filters = [
    'Student ID',
    'Account Number',
    'Date Of Birth',
  ];
  String? _selectedFilter;
  bool isSearchFieldEnable = false;

  @override
  void initState() {
    super.initState();
    _studentId.text = '';
    _parentId.text = '';
    _dob.text = '';
  }

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
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                color: PayNestTheme.colorWhite,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalValue(30)),
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      verticalSpacer(36),
                      Text(
                        enterStudent,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: sizes.fontRatio * 15,
                          color: PayNestTheme.primaryColor,
                        ),
                      ),
                      verticalSpacer(10),
                      Text(
                        addDetails,
                        style: PayNestTheme.small_2_12black.copyWith(
                          fontWeight: FontWeight.w200,
                          fontSize: sizes.fontRatio * 12,
                          color: PayNestTheme.black.withOpacity(0.7),
                        ),
                      ),
                      verticalSpacer(16),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        child: Text(
                          pleaseSelect,
                          style: PayNestTheme.small_2_12black.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                      ),
                      verticalSpacer(16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PayNestTheme.primaryColor,
                                  width: 1.w,
                                ),
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  buttonPadding: EdgeInsets.symmetric(
                                    horizontal: horizontalValue(16),
                                  ),
                                  style: PayNestTheme.h2_12blueAccentLight
                                      .copyWith(
                                    fontSize: sizes.fontRatio * 14,
                                    color: PayNestTheme.lightBlack,
                                    fontFamily: 'montserratRegular',
                                  ),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                    border: Border.all(
                                      color: PayNestTheme.primaryColor,
                                    ),
                                  ),
                                  isExpanded: false,
                                  hint: Text(
                                    'Select',
                                    style: PayNestTheme.h2_12blueAccentLight
                                        .copyWith(
                                      fontSize: sizes.fontRatio * 14,
                                      color: PayNestTheme.black,
                                      fontFamily: 'montserratBold',
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  items: filters
                                      .map(
                                        (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: PayNestTheme
                                                .h2_12blueAccentLight
                                                .copyWith(
                                              fontSize: sizes.fontRatio * 14,
                                              color: PayNestTheme.lightBlack,
                                              fontFamily: 'montserratSemiBold',
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  value: _selectedFilter,
                                  onChanged: (value) {
                                    _selectedFilter = value as String;
                                    isSearchFieldEnable = true;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      verticalSpacer(16),
                      _selectedFilter == 'Date Of Birth'
                          ? const SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalValue(16),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PayNestTheme.primaryColor,
                                  width: 1.w,
                                ),
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: _studentId,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelText: _selectedFilter,
                                  labelStyle:
                                      PayNestTheme.h2_12blueAccent.copyWith(
                                    fontSize: sizes.fontRatio * 12,
                                    color: PayNestTheme.primaryColor,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                      _selectedFilter == 'Date Of Birth'
                          ? InkWellWidget(
                              onTap: () {
                                showDialog(
                                  builder: (sdCTX) {
                                    return AlertDialog(
                                      title: Row(
                                        children: [
                                          InkWellWidget(
                                            onTap: () {
                                              Navigator.pop(sdCTX);
                                            },
                                            child: Container(
                                              height: 25.h,
                                              width: 70.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                color: PayNestTheme.blueAccent,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Done",
                                                  style: PayNestTheme
                                                      .small_2_12white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      content: SizedBox(
                                        width: .9.sw,
                                        height: .5.sh,
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged:
                                              (DateTime dateTime) {
                                            tempPickedDate = dateTime;
                                            _dob.text = DateFormat("yyyy-MM-dd")
                                                .format(dateTime)
                                                .toString();
                                          },
                                          initialDateTime: DateTime.now(),
                                        ),
                                      ),
                                    );
                                  },
                                  context: context,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(16),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PayNestTheme.primaryColor,
                                    width: 1.w,
                                  ),
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                                child: TextFormField(
                                  controller: _dob,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            PayNestTheme.textGrey.withOpacity(
                                          0.5,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: PayNestTheme.textGrey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                    labelText: dateOfBirth,
                                    labelStyle:
                                        PayNestTheme.h2_12blueAccent.copyWith(
                                      fontSize: sizes.fontRatio * 12,
                                      color: PayNestTheme.primaryColor,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: PayNestTheme.textGrey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: PayNestTheme.textGrey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: PayNestTheme.textGrey
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      verticalSpacer(12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PayNestTheme.primaryColor,
                            elevation: 0,
                            side: BorderSide(
                              width: 1,
                              color: PayNestTheme.primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: verticalValue(14),
                            ),
                          ),
                          onPressed: () {
                            widget.onTap(
                              _selectedFilter == 'Student ID'
                                  ? _studentId.text
                                  : '',
                              _selectedFilter == 'Account Number'
                                  ? _studentId.text
                                  : '',
                              _selectedFilter == 'Date Of Birth'
                                  ? _dob.text
                                  : '',
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
                      verticalSpacer(12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PayNestTheme.colorWhite,
                            elevation: 0,
                            side: BorderSide(
                              width: 1,
                              color: PayNestTheme.primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: verticalValue(14),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text(
                              cancel,
                              style:
                                  PayNestTheme.title_2_16primaryColor.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: PayNestTheme.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      verticalSpacer(16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
