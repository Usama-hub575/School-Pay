import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/addstudent_controller.dart';
import 'package:paynest_flutter_app/controller/all_studentslist_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/selectedschool_to_addstudent.dart';
import 'package:paynest_flutter_app/model/studentlist_res_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/addstudent/widget/student_bottom_sheet.dart';
import 'package:paynest_flutter_app/views/host/dashboard/widgets/succes_bottom_sheet.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../presentation/res/res.dart';
import '../../../widgets/inkwell_widget.dart';
import '../../../widgets/toast.dart';

class AddStudent extends StatefulWidget {
  SelectedSchoolData schoolData;

  AddStudent({Key? key, required this.schoolData}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController studentRegController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  StudentListController studentListController =
      Get.put(StudentListController());
  AddStudentController addStudentController = Get.put(AddStudentController());
  final UserController userController = Get.find<UserController>();

  List<String> filters = [];
  String? _selectedFilter;
  bool isExpanded = false;
  bool isSearchFieldEnable = false;
  bool isLoading = false;

  @override
  void initState() {
    isExpanded = false;
    isLoading = false;
    filters = widget.schoolData.payeeType == 'STUDENT' ? ['Name', 'Account Number', 'Student ID'] : ['Account Number'];
    super.initState();
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    switch (_selectedFilter) {
      case 'Name':
        if (studentListController.studentList.value.getStudent != null &&
            studentListController.studentList.value.getStudent!.rows!.length >
                0) {
          studentListController.studentList.value.getStudent!.rows!.clear();
        }
        await studentListController.search(
          searchBy: 'name',
          queryParam: searchController.text,
          schoolId: widget.schoolData.id,
        );
        isLoading = false;
        if (studentListController.studentList.value.getStudent != null) {
          studentListController.studentList.value.getStudent!.rows!
              .forEach((studentDetails) {
            _searchResult.add(studentDetails);
          });
        }
        setState(() {});
        break;
      case 'Account Number':
        if (studentListController.studentList.value.getStudent != null &&
            studentListController.studentList.value.getStudent!.rows!.length >
                0) {
          studentListController.studentList.value.getStudent!.rows!.clear();
        }
        await studentListController.search(
          searchBy: 'account',
          queryParam: searchController.text,
          schoolId: widget.schoolData.id,
        );
        isLoading = false;
        if (studentListController.studentList.value.getStudent != null) {
          studentListController.studentList.value.getStudent!.rows!
              .forEach((studentDetails) {
            _searchResult.add(studentDetails);
          });
        }
        setState(() {});
        break;
      case 'Student ID':
        if (studentListController.studentList.value.getStudent != null &&
            studentListController.studentList.value.getStudent!.rows!.length >
                0) {
          studentListController.studentList.value.getStudent!.rows!.clear();
        }
        await studentListController.search(
          searchBy: 'sid',
          queryParam: searchController.text,
          schoolId: widget.schoolData.id,
        );
        isLoading = false;
        if (studentListController.studentList.value.getStudent != null) {
          studentListController.studentList.value.getStudent!.rows!
              .forEach((studentDetails) {
            _searchResult.add(studentDetails);
          });
        }
        setState(() {});
        break;
    }
  }

  List<StudentListRowData> _searchResult = [];
  List<StudentListRowData> sortedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => !studentListController.isLoading.value
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: PayNestTheme.primaryColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(
                            24.r,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          verticalSpacer(32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 25.w,
                                ),
                                child: Container(
                                  height: 44.h,
                                  width: 44.w,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 1.0,
                                        offset: Offset(
                                          1.3, // Move to right 10  horizontally
                                          1.3, // Move to bottom 10 Vertically
                                        ),
                                      ),
                                    ],
                                    color: PayNestTheme.colorWhite,
                                    borderRadius: BorderRadius.circular(
                                      12.r,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      size: 20.sp,
                                      color: PayNestTheme.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              horizontalSpacer(40),
                              Center(
                                child: Text(
                                  addStudent,
                                  textAlign: TextAlign.center,
                                  style: PayNestTheme.title20white.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'montserratBold',
                                    fontSize: sizes.fontRatio*18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpacer(16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _getSchoolContainer(),
                              verticalSpacer(20),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: horizontalValue(16),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1.w,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      // child: DropdownButtonHideUnderline(
                                      //   child: ButtonTheme(
                                      //     alignedDropdown: true,
                                      //     child: DropdownButton(
                                      //       borderRadius:
                                      //           BorderRadius.circular(16),
                                      //       elevation: 0,
                                      //       isExpanded: true,
                                      //       items: filters.map((String value) {
                                      //         return DropdownMenuItem<String>(
                                      //           value: value,
                                      //           child: Text(
                                      //             value,
                                      //             style: PayNestTheme
                                      //                 .h2_12blueAccent
                                      //                 .copyWith(
                                      //               fontSize:
                                      //                   sizes.fontRatio * 14,
                                      //               fontWeight: FontWeight.bold,
                                      //               color: PayNestTheme.black,
                                      //             ),
                                      //           ),
                                      //         );
                                      //       }).toList(),
                                      //       value: _selectedFilter,
                                      //       hint: Text(
                                      //         "Search by",
                                      //       ),
                                      //       // value: selection,
                                      //       onChanged: (newValue) {
                                      //         setState(
                                      //           () {
                                      //             _selectedFilter =
                                      //                 newValue.toString();
                                      //             print(
                                      //               _selectedFilter,
                                      //             );
                                      //           },
                                      //         );
                                      //       },
                                      //     ),
                                      //   ),
                                      // ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          buttonPadding: EdgeInsets.symmetric(
                                            horizontal: horizontalValue(16),
                                          ),
                                          style: PayNestTheme
                                              .h2_12blueAccentLight
                                              .copyWith(
                                            fontSize: sizes.fontRatio * 14,
                                            color: PayNestTheme.lightBlack,
                                            fontFamily: 'montserratRegular',
                                          ),
                                          icon: SvgPicture.asset(
                                            icArrowDropDown,
                                          ),
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                            ),
                                            border: Border.all(
                                              color: PayNestTheme.primaryColor,
                                            ),
                                          ),
                                          isExpanded: false,
                                          hint: Text(
                                            'Search By',
                                            style: PayNestTheme
                                                .h2_12blueAccentLight
                                                .copyWith(
                                              fontSize: sizes.fontRatio * 14,
                                              color: PayNestTheme.black,
                                              fontFamily: 'montserratBold',
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          items: filters
                                              .map(
                                                (item) =>
                                                    DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: PayNestTheme
                                                        .h2_12blueAccentLight
                                                        .copyWith(
                                                      fontSize:
                                                          sizes.fontRatio * 14,
                                                      color: PayNestTheme
                                                          .lightBlack,
                                                      fontFamily:
                                                          'montserratSemiBold',
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                              verticalSpacer(12),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: horizontalValue(16),
                                ),
                                child: TextFormField(
                                  controller: searchController,
                                  onTap: () {
                                    if (isSearchFieldEnable == true) {
                                      onSearchTextChanged('');
                                    } else {

                                      showToast(
                                          context: context,
                                          messege:  "Please Select Search By Field First",
                                          color: PayNestTheme.primaryColor);
                                    }
                                    setState(() {});
                                  },
                                  enabled: isSearchFieldEnable,
                                  onEditingComplete: () {
                                    if (searchController.text.isNotEmpty) {
                                      onSearchTextChanged(
                                        searchController.text,
                                      );
                                    } else {
                                      _searchResult.clear();
                                    }
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(13),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: PayNestTheme.primaryColor
                                            .withOpacity(0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: PayNestTheme.primaryColor,
                                    ),
                                    hintText: searchStudent,
                                    hintStyle: PayNestTheme.small_2_12textGrey.copyWith(
                                  fontSize: sizes.fontRatio * 13,
                                    color: PayNestTheme.textGrey.withOpacity(0.3),
                                  ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              verticalSpacer(16),
                            ],
                          )
                        ],
                      ),
                    ),
                    _searchResult.isNotEmpty || searchController.text.isNotEmpty
                        ? studentListController.studentList.value.getStudent !=
                                    null &&
                                studentListController.studentList.value
                                        .getStudent!.rows!.length !=
                                    0
                            ? Column(
                                children: [
                                  verticalSpacer(16),
                                  _getText(
                                    _searchResult.length,
                                  ),
                                  ListView.separated(
                                    itemCount: _searchResult.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          InkWellWidget(
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: horizontalValue(20),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: horizontalValue(12),
                                                vertical: verticalValue(8),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color:
                                                      PayNestTheme.primaryColor,
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: sizes.heightRatio * 50,
                                                    width: sizes.widthRatio * 50,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      _searchResult[index].gender == "male" ? icMale : icFemale,
                                                    ),
                                                  ),
                                                  horizontalSpacer(26),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: sizes.widthRatio*100,
                                                        child: Text(
                                                          
                                                          '${_searchResult[index].firstName}\n${_searchResult[index].lastName ?? ''}',
                                                          style: PayNestTheme
                                                              .title20white
                                                              .copyWith(
                                                            fontSize:
                                                                sizes.fontRatio *
                                                                    14,
                                                            fontFamily:
                                                                'montserratBold',
                                                            color: PayNestTheme
                                                                .black,
                                                          ),
                                                        ),
                                                      ),
                                                      verticalSpacer(4),
                                                      _searchResult[index].grade != null ?Text(
                                                        'Grade ${_searchResult[index].grade}',
                                                        style: PayNestTheme
                                                            .h2_14textGrey
                                                            .copyWith(
                                                          fontSize:
                                                              sizes.fontRatio *
                                                                  10,
                                                          fontFamily:
                                                              'montserratRegular',
                                                        ),
                                                      ): const SizedBox.shrink(),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  _getActionButton(
                                                    onTap: () async {
                                                      if (_selectedFilter ==
                                                          'Account Number') {
                                                        final model = {
                                                          "parentRegNo":
                                                              searchController
                                                                  .text
                                                                  .toString(),
                                                          "studentId":
                                                              _searchResult[
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                        };
                                                        await addStudentController
                                                            .hitAddStudentByParentId(
                                                          model,
                                                        );
                                                        Navigator.of(
                                                          context,
                                                        ).pop();
                                                        setState(() {});
                                                        if (addStudentController
                                                            .isStudentAdded) {
                                                          SuccessBottomSheet.show(
                                                            context: context,
                                                          );
                                                        } else {

                                                          showToast(
                                                              context: context,
                                                              messege:  addStudentController
                                                                  .addStudentData
                                                                  .value
                                                                  .message ??
                                                                  'Verification Failed',
                                                              color: PayNestTheme.red);
                                                        }

                                                        searchController.text =
                                                        '';
                                                        if (studentListController
                                                            .studentList
                                                            .value
                                                            .getStudent !=
                                                            null &&
                                                            studentListController
                                                                .studentList
                                                                .value
                                                                .getStudent!
                                                                .rows!
                                                                .length >
                                                                0) {
                                                          studentListController
                                                              .studentList
                                                              .value
                                                              .getStudent!
                                                              .rows!
                                                              .clear();
                                                        }
                                                      }
                                                      if (_selectedFilter ==
                                                          'Student ID') {
                                                        final model = {
                                                          "studentRegNo":
                                                              searchController
                                                                  .text
                                                                  .toString(),
                                                          "studentId":
                                                              _searchResult[
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                        };

                                                        await addStudentController
                                                            .hitAddStudentByStudentId(
                                                          model,
                                                        );
                                                        Navigator.of(
                                                          context,
                                                        ).pop();
                                                        setState(() {});
                                                        if (addStudentController
                                                            .isStudentAdded) {
                                                          SuccessBottomSheet.show(
                                                            context: context,
                                                          );

                                                        } else {
                                                          showToast(
                                                              context: context,
                                                              messege:   addStudentController
                                                                  .addStudentData
                                                                  .value
                                                                  .message ??
                                                                  'Verification Failed',
                                                              color: PayNestTheme.red);
                                                        }

                                                        searchController.text =
                                                        '';
                                                        if (studentListController
                                                            .studentList
                                                            .value
                                                            .getStudent !=
                                                            null &&
                                                            studentListController
                                                                .studentList
                                                                .value
                                                                .getStudent!
                                                                .rows!
                                                                .length >
                                                                0) {
                                                          studentListController
                                                              .studentList
                                                              .value
                                                              .getStudent!
                                                              .rows!
                                                              .clear();
                                                        }
                                                      }
                                                      if (_selectedFilter !=
                                                              'Account Number' &&
                                                          _selectedFilter !=
                                                              'Student ID') {
                                                        StudentBottomSheet.show(
                                                          context: context,
                                                          selectedStudentID:
                                                              _searchResult[
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                          selectedStudentRegNo:
                                                              _searchResult[
                                                                      index]
                                                                  .studentRegNo
                                                                  .toString(),
                                                          onTap: (
                                                            studentId,
                                                            parentId,
                                                            dob,
                                                          ) async {
                                                            if (studentId
                                                                    .isNotEmpty ||
                                                                dob
                                                                    .isNotEmpty ||
                                                                parentId
                                                                    .isNotEmpty) {
                                                              final model = {
                                                                "parentRegNo":
                                                                    parentId,
                                                                "dob": dob,
                                                                "studentId":
                                                                    _searchResult[
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                "studentRegNo":
                                                                    studentId,
                                                              };
                                                              await addStudentController
                                                                  .hitAddStudentByFirstName(
                                                                model,
                                                              );
                                                              Navigator.of(
                                                                context,
                                                              ).pop();
                                                              setState(() {});
                                                              if (addStudentController
                                                                  .isStudentAdded) {
                                                                SuccessBottomSheet.show(
                                                                  context: context,
                                                                );
                                                              } else {

                                                                showToast(
                                                                    context: context,
                                                                    messege:   addStudentController
                                                                        .addStudentData
                                                                        .value
                                                                        .message ??
                                                                        'Verification Failed',
                                                                    color: PayNestTheme.red);
                                                              }

                                                              searchController.text =
                                                              '';
                                                              if (studentListController
                                                                  .studentList
                                                                  .value
                                                                  .getStudent !=
                                                                  null &&
                                                                  studentListController
                                                                      .studentList
                                                                      .value
                                                                      .getStudent!
                                                                      .rows!
                                                                      .length >
                                                                      0) {
                                                                studentListController
                                                                    .studentList
                                                                    .value
                                                                    .getStudent!
                                                                    .rows!
                                                                    .clear();
                                                              }
                                                            } else {

                                                              showToast(
                                                                  context: context,
                                                                  messege:  'Fields can not be empty',
                                                                  color: PayNestTheme.red);
                                                            }
                                                          },
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  horizontalSpacer(12),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return verticalSpacer(12);
                                    },
                                  ),
                                  verticalSpacer(24),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: horizontalValue(40),
                                    ),
                                    child: Text(
                                      'For Alternate Use Case With All Text Fields Please Click Here. (This Will Not Be Shown On Actual App)',
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      style:
                                          PayNestTheme.h2_14textGrey.copyWith(
                                        fontFamily: "montserratRegular",
                                        fontSize: sizes.fontRatio * 10,
                                      ),
                                    ),
                                  ),
                                  verticalSpacer(16),
                                ],
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 80,
                                  horizontal: 10,
                                ),
                                child: Center(
                                  child: Text(
                                    'No data found  !!',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              )
                        : SizedBox.shrink(),
                    _searchResult.isNotEmpty || searchController.text.isNotEmpty
                        ? studentListController.studentList.value.getStudent !=
                                    null &&
                                studentListController.studentList.value
                                        .getStudent!.rows!.length !=
                                    0
                            ? verticalSpacer(0)
                            : verticalSpacer(80)
                        : verticalSpacer(220),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(32),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: PayNestTheme.primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              14,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: verticalValue(16),
                          ),
                        ),
                        onPressed: () {
                          if (searchController.text.isEmpty) {

                            showToast(
                                context: context,
                                messege:  'Search Can Not Be Empty!',
                                color: PayNestTheme.red);
                          }
                          if (searchController.text.isNotEmpty) {
                            isLoading = true;
                            onSearchTextChanged(
                              searchController.text,
                            );
                          } else {
                            _searchResult.clear();
                          }
                          setState(() {});
                        },
                        child: Center(
                          child: !isLoading
                              ? Text(
                                  search,
                                  style: PayNestTheme.title_2_16primaryColor
                                      .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: PayNestTheme.colorWhite,
                                  ),
                                )
                              : Center(
                                  child: Container(
                                    height: sizes.heightRatio * 16,
                                    width: sizes.widthRatio * 16,
                                    child: CircularProgressIndicator(
                                      backgroundColor: PayNestTheme.colorWhite,
                                      color: PayNestTheme.blueAccent,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    verticalSpacer(16),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _getActionButton({required Function onTap}) {
    return InkWellWidget(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(12),
          vertical: verticalValue(6),
        ),
        decoration: BoxDecoration(
          color: PayNestTheme.primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          _selectedFilter == 'Account Number' || _selectedFilter == 'Student ID'
              ? 'Add'
              : 'Verify & Add',
          style: PayNestTheme.h2_12blueAccent.copyWith(
            fontSize: sizes.fontRatio * 9,
            color: PayNestTheme.colorWhite,
            fontFamily: 'montserratBold',
          ),
        ),
      ),
    );
  }

  Widget _getText(int length) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(36),
      ),
      child: Row(
        children: [
          Text(
            'Search Result',
            style: PayNestTheme.h2_12blueAccent.copyWith(
              fontSize: sizes.fontRatio * 16,
              color: PayNestTheme.black,
              fontFamily: 'montserratBold',
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.primaryColor,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(10),
              vertical: verticalValue(10),
            ),
            child: Text(
              '$length',
              style: PayNestTheme.h2_12blueAccent.copyWith(
                fontSize: sizes.fontRatio * 16,
                color: PayNestTheme.colorWhite,
                fontFamily: 'montserratSemiBold',
              ),
            ),
          ),
          horizontalSpacer(16),
        ],
      ),
    );
  }

  Widget _getSchoolContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: PayNestTheme.colorWhite,
        borderRadius: BorderRadius.circular(
          16.r,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      padding: EdgeInsets.symmetric(
        vertical: verticalValue(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            schoolCampusAnimation,
            repeat: true,
            width: sizes.widthRatio * 172,
            height: sizes.heightRatio * 96,
            fit: BoxFit.fill,
          ),
          Text(
            widget.schoolData.name,
            textAlign: TextAlign.center,
            style: PayNestTheme.h2_12blueAccent.copyWith(
              fontSize: sizes.fontRatio * 22,
              color: PayNestTheme.black,
              fontFamily: 'montserratBold',
            ),
          ),
          verticalSpacer(6),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
            ),
            child: Text(
              widget.schoolData.address,
              textAlign: TextAlign.center,
              style: PayNestTheme.h2_14textGrey.copyWith(
                fontFamily: "montserratRegular",
                fontSize: sizes.fontRatio * 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
