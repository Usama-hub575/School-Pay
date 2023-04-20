import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/export.dart';

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
        return StudentsWidget(
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

class StudentsWidget extends StatefulWidget {
  final String selectedStudentID;
  final String selectedStudentRegNo;
  final Function(String studentId, String parentId, String studentDOB) onTap;

  const StudentsWidget({
    super.key,
    required this.selectedStudentID,
    required this.selectedStudentRegNo,
    required this.onTap,
  });

  @override
  State<StudentsWidget> createState() => _StudentsWidgetState();
}

class _StudentsWidgetState extends State<StudentsWidget> {
  final TextEditingController _studentId = TextEditingController();
  final TextEditingController _parentId = TextEditingController();
  final TextEditingController _dob = TextEditingController();
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
      color: colors.black.withOpacity(0),
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
                color: colors.white,
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
                        style: textStyles.bold.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: sizes.fontRatio * 15,
                          color: colors.primaryColor,
                        ),
                      ),
                      verticalSpacer(10),
                      Text(
                        addDetails,
                        style: textStyles.regular.copyWith(
                          fontWeight: FontWeight.w200,
                          fontSize: sizes.fontRatio * 12,
                          color: colors.black.withOpacity(0.7),
                        ),
                      ),
                      verticalSpacer(16),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        child: Text(
                          pleaseSelect,
                          style: textStyles.regular.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: sizes.fontRatio * 12,
                            color: colors.primaryColor,
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
                                  color: colors.primaryColor,
                                ),
                                color: colors.white,
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
                                  style: textStyles.regular.copyWith(
                                    fontSize: sizes.fontRatio * 14,
                                    color: colors.lightGreyShade,
                                  ),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                    border: Border.all(
                                      color: colors.primaryColor,
                                    ),
                                  ),
                                  isExpanded: false,
                                  hint: Text(
                                    'Select',
                                    style: textStyles.bold.copyWith(
                                      fontSize: sizes.fontRatio * 14,
                                      color: colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  items: filters
                                      .map(
                                        (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: textStyles.semiBold.copyWith(
                                              fontSize: sizes.fontRatio * 14,
                                              color: colors.lightGreyShade,
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
                                  color: colors.primaryColor,
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
                                  labelStyle: textStyles.bold.copyWith(
                                    fontSize: sizes.fontRatio * 12,
                                    color: colors.primaryColor,
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
                                              height: verticalValue(25),
                                              width: horizontalValue(70),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: colors.blueAccent,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Done",
                                                  style: textStyles.semiBold
                                                      .copyWith(
                                                    color: colors.white,
                                                    fontSize:
                                                        sizes.fontRatio * 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      content: SizedBox(
                                        width: horizontalValue(.9),
                                        height: verticalValue(.5),
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
                                    color: colors.primaryColor,
                                  ),
                                  color: colors.white,
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
                                        color: colors.textGrey.withOpacity(
                                          0.5,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: colors.textGrey.withOpacity(0.5),
                                      ),
                                    ),
                                    labelText: dateOfBirth,
                                    labelStyle: textStyles.bold.copyWith(
                                      fontSize: sizes.fontRatio * 12,
                                      color: colors.primaryColor,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: colors.textGrey.withOpacity(0.5),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: colors.textGrey.withOpacity(0.5),
                                      ),
                                    ),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: colors.textGrey.withOpacity(0.5),
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
                        child: ElevatedButtons(
                          isLoading: false,
                          color: colors.primaryColor,
                          text: next,
                          textColor: colors.white,
                          showIcon: false,
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
                        ),
                      ),
                      verticalSpacer(12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButtons(
                          color: colors.white,
                          textColor: colors.black,
                          text: cancel,
                          isLoading: false,
                          showIcon: false,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
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
