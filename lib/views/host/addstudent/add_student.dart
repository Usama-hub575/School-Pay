import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/addstudent_controller.dart';
import 'package:paynest_flutter_app/controller/all_studentslist_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/model/addstudent_model.dart';
import 'package:paynest_flutter_app/model/datamodel/selectedschool_to_addstudent.dart';
import 'package:paynest_flutter_app/model/studentlist_res_model.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/addstudent/widget/student_bottom_sheet.dart';
import 'package:paynest_flutter_app/views/host/dashboard/widgets/succes_bottom_sheet.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

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

  List<String> filters = ['First Name', 'Last Name', 'Email ID', 'Student ID'];
  String? _selectedFilter;

  @override
  void initState() {
    super.initState();
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    switch (_selectedFilter) {
      case 'First Name':
        await studentListController.search(
          searchBy: 'first',
          queryParam: searchController.text,
          schoolId: widget.schoolData.id,
        );
        studentListController.studentList.value.getStudent!.rows!
            .forEach((studentDetails) {
          _searchResult.add(studentDetails);
        });
        setState(() {});
        break;
      case 'Last Name':
        await studentListController.search(
          searchBy: 'last',
          queryParam: searchController.text,
          schoolId: widget.schoolData.id,
        );
        studentListController.studentList.value.getStudent!.rows!
            .forEach((studentDetails) {
          _searchResult.add(studentDetails);
        });
        setState(() {});
        break;
      case 'Email ID':
        await studentListController.search(
          searchBy: 'email',
          queryParam: searchController.text,
          schoolId: widget.schoolData.id,
        );
        studentListController.studentList.value.getStudent!.rows!
            .forEach((studentDetails) {
          _searchResult.add(studentDetails);
        });
        setState(() {});
        break;
      case 'Student ID':
        await studentListController.search(
          searchBy: 'sid',
          queryParam: searchController.text,
          schoolId: widget.schoolData.id,
        );
        studentListController.studentList.value.getStudent!.rows!
            .forEach((studentDetails) {
          _searchResult.add(studentDetails);
        });
        setState(() {});
        break;
    }
  }

  /// -- Search -- ///
  List<StudentListRowData> _searchResult = [];
  List<StudentListRowData> sortedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => !studentListController.isLoading.value
          ? ListView(
              children: [
                Container(
                  // height: 460.h,
                  decoration: BoxDecoration(
                      color: PayNestTheme.primaryColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(24.r))),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 25.w,
                        top: 25.h,
                        right: 25.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(12.r)),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back,
                                        size: 20.sp,
                                        color: PayNestTheme.blueAccent),
                                    // child: Text(""),
                                  ),
                                ),
                              ),
                              Center(
                                  child: Text(addStudent,
                                      style: PayNestTheme.title20white)),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //FOR STACK
                          SizedBox(
                            height: 350.h,
                            width: 326.w,
                            // color: Colors.grey,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 41.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 60.w),
                                        height: 149.h,
                                        width: 1.sw,
                                        decoration: BoxDecoration(
                                            color: PayNestTheme.colorWhite,
                                            borderRadius:
                                                BorderRadius.circular(16.r)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 19.h,
                                            ),
                                            Text(
                                              widget.schoolData.name,
                                              style: PayNestTheme.title18black,
                                            ),
                                            Text(
                                              widget.schoolData.address,
                                              style: PayNestTheme.h2_14textGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 1.w),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                    10,
                                                  ),
                                                ),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: ButtonTheme(
                                                  alignedDropdown: true,
                                                  child: DropdownButton(
                                                    elevation: 0,
                                                    isExpanded: true,
                                                    items: filters
                                                        .map((String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          style: PayNestTheme
                                                              .h2_12blueAccent
                                                              .copyWith(
                                                                  fontSize:
                                                                      sizes.fontRatio *
                                                                          14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      PayNestTheme
                                                                          .black),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    value: _selectedFilter,
                                                    hint: Text(
                                                      "Search by",
                                                    ),
                                                    // value: selection,
                                                    onChanged: (newValue) {
                                                      setState(
                                                        () {
                                                          _selectedFilter =
                                                              newValue
                                                                  .toString();
                                                          print(
                                                            _selectedFilter,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: TextFormField(
                                          controller: searchController,
                                          onTap: () {
                                            onSearchTextChanged('');
                                          },
                                          onEditingComplete: () {
                                            if (searchController
                                                .text.isNotEmpty) {
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: PayNestTheme.primaryColor,
                                            ),
                                            hintText: searchStudent,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: CircleAvatar(
                                    radius: 41.r,
                                    backgroundColor: PayNestTheme.blueAccent,
                                    // backgroundImage: AssetImage(ic_schoolWhite),
                                    child: Padding(
                                      padding: EdgeInsets.all(21.h),
                                      child: Image.asset(
                                        ic_schoolWhite,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // Search Result
                _searchResult.isNotEmpty || searchController.text.isNotEmpty
                    ? studentListController
                                .studentList.value.getStudent!.rows!.length !=
                            0
                        ? ListView.builder(
                            itemCount: _searchResult.length,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpacer(16),
                                  _getText(),
                                  verticalSpacer(16),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: horizontalValue(16),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: horizontalValue(12),
                                        vertical: verticalValue(8),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: PayNestTheme.primaryColor,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: sizes.heightRatio * 60,
                                            width: sizes.heightRatio * 60,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                'https://cdn.dribbble.com/users/1973964/screenshots/8807446/admissions_4x.jpg',
                                              ),
                                            ),
                                          ),
                                          horizontalSpacer(12),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${_searchResult[index].firstName} \t ${_searchResult[index].lastName}',
                                                style: PayNestTheme
                                                    .h2_12blueAccent
                                                    .copyWith(
                                                  fontSize:
                                                      sizes.fontRatio * 14,
                                                  color: PayNestTheme.black,
                                                ),
                                              ),
                                              Text(
                                                'Grade ${_searchResult[index].grade}',
                                                style: PayNestTheme
                                                    .h2_12blueAccentLight
                                                    .copyWith(
                                                  fontSize:
                                                      sizes.fontRatio * 12,
                                                  color: PayNestTheme.textGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          _getActionButton(
                                            onTap: () {
                                              StudentBottomSheet.show(
                                                context: context,
                                                selectedStudentID:
                                                    _searchResult[index]
                                                        .id
                                                        .toString(),
                                                selectedStudentRegNo:
                                                    _searchResult[index]
                                                        .studentRegNo
                                                        .toString(),
                                                onTap: (studentId, dob) async {
                                                  if(studentId.isNotEmpty && dob.isNotEmpty){
                                                    final model = {
                                                      "parentId": userController
                                                          .userResData
                                                          .value
                                                          .parent!
                                                          .id
                                                          .toString(),
                                                      "dob": dob,
                                                      "studentId": studentId,
                                                      "studentRegNo":
                                                      _searchResult[index]
                                                          .studentRegNo
                                                          .toString(),
                                                    };
                                                    Navigator.of(context).pop();
                                                    await addStudentController
                                                        .hitAddStudent(model);
                                                    if (addStudentController
                                                        .isStudentAdded) {
                                                      SuccessBottomSheet.show(context: context);
                                                    } else {
                                                      Navigator.of(context)
                                                          .pop();
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          behavior:
                                                          SnackBarBehavior
                                                              .floating,
                                                          content: Text(
                                                            'Verification failed',
                                                          ),
                                                          backgroundColor:
                                                          Colors.red,
                                                        ),
                                                      );
                                                    }
                                                  }else{
                                                    Navigator.of(context)
                                                        .pop();
                                                    ScaffoldMessenger.of(
                                                        context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        behavior:
                                                        SnackBarBehavior
                                                            .floating,
                                                        content: Text(
                                                          'Fields can not be empty',
                                                        ),
                                                        backgroundColor:
                                                        Colors.red,
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
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
                    : SizedBox(),
              ],
            )
          : Center(child: CircularProgressIndicator())),
    );
  }

  Widget _getActionButton({required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(12),
          vertical: verticalValue(2),
        ),
        decoration: BoxDecoration(
          color: PayNestTheme.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'Verify & add',
          style: PayNestTheme.h2_12blueAccent.copyWith(
            fontSize: sizes.fontRatio * 12,
            color: PayNestTheme.colorWhite,
          ),
        ),
      ),
    );
  }

  Widget _getText() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue(36),
      ),
      child: Text(
        'Search Result',
        style: PayNestTheme.h2_12blueAccent.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: sizes.fontRatio * 14,
          color: PayNestTheme.black,
        ),
      ),
    );
  }
}
