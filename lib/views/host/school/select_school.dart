import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/school_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/selectedschool_to_addstudent.dart';
import 'package:paynest_flutter_app/model/schoollist_model.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/addstudent/add_student.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

class SelectSchool extends StatefulWidget {
  const SelectSchool({Key? key}) : super(key: key);

  @override
  State<SelectSchool> createState() => _SelectSchoolState();
}

class _SelectSchoolState extends State<SelectSchool> {
  SchoolController schoolController = Get.put(SchoolController());
  TextEditingController ssController = TextEditingController();

  @override
  initState() {
    super.initState();
    schoolController.hitSchoolList();
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    schoolController.schoolResList.value.log!.forEach((schoolDetail) {
      if (schoolDetail.name.toUpperCase().contains(text.toUpperCase()) ||
          schoolDetail.address.toUpperCase().contains(text.toUpperCase())) {
        _searchResult.add(schoolDetail);
      }
    });

    setState(() {});
  }

  List<Log> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => !schoolController.isLoading.value
            ? Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: verticalValue(16),
                    ),
                    decoration: BoxDecoration(
                      color: PayNestTheme.primaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(24.r),
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalValue(16),
                          vertical: verticalValue(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 25.w),
                                  child: Container(
                                    height: 44.h,
                                    width: 44.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 20.sp,
                                        color: PayNestTheme.blueAccent,
                                      ),
                                      // child: Text(""),
                                    ),
                                  ),
                                ),
                                Text(
                                  selectSchool,
                                  style: PayNestTheme.title20white,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  width: 44.w,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpacer(16),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(16),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      onTap: () {
                        onSearchTextChanged('');
                      },
                      controller: ssController,
                      onChanged: onSearchTextChanged,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: horizontalValue(16),
                          vertical: verticalValue(16),
                        ),
                        filled: true,
                        fillColor: PayNestTheme.colorWhite,
                        prefixIcon: Icon(
                          Icons.search,
                          color: PayNestTheme.primaryColor,
                        ),
                        hintText: searchSchool,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.sp,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: PayNestTheme.primaryColor,
                            width: 1.w,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: PayNestTheme.primaryColor,
                            width: 1.w,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: PayNestTheme.primaryColor,
                            width: 1.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: PayNestTheme.primaryColor,
                            width: 1.w,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  _searchResult.isNotEmpty || ssController.text.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _searchResult.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  _singleCard(
                                    log: schoolController
                                        .schoolResList.value.log![index],
                                  ),
                                  verticalSpacer(8),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: horizontalValue(20),
                                    ),
                                    width: 1.sw,
                                    height: 1,
                                    color: PayNestTheme.textGrey,
                                  ),
                                  verticalSpacer(8),
                                ],
                              );
                            },
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: schoolController
                                .schoolResList.value.log!.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  _singleCard(
                                    log: schoolController
                                        .schoolResList.value.log![index],
                                  ),
                                  verticalSpacer(8),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: horizontalValue(20),
                                    ),
                                    width: 1.sw,
                                    height: 1,
                                    color: PayNestTheme.textGrey,
                                  ),
                                  verticalSpacer(8),
                                ],
                              );
                            },
                          ),
                        ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _singleCard({required Log log}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(16),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
                SelectedSchoolData schoolData = SelectedSchoolData(
                    id: log.id,
                    name: log.name,
                    deletedAt: log.deletedAt,
                    addedBy: log.addedBy,
                    address: log.address,
                    description: log.description,
                    vat: log.vat,
                    paynestFee: log.paynestFee,
                    apiKey: log.apiKey,
                    merchantId: log.merchantId,
                    file: log.file,
                    privacy: log.privacy,
                    createdAt: log.createdAt,
                    updatedAt: log.updatedAt);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddStudent(
                      schoolData: schoolData,
                    ),
                  ),
                );

            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn2.vectorstock.com/i/1000x1000/20/76/man-avatar-profile-vector-21372076.jpg',
                ),
              ),
            ),
          ),
          horizontalSpacer(16),
          GestureDetector(
            onTap: () {
                SelectedSchoolData schoolData = SelectedSchoolData(
                    id: log.id,
                    name: log.name,
                    deletedAt: log.deletedAt,
                    addedBy: log.addedBy,
                    address: log.address,
                    description: log.description,
                    vat: log.vat,
                    paynestFee: log.paynestFee,
                    apiKey: log.apiKey,
                    merchantId: log.merchantId,
                    file: log.file,
                    privacy: log.privacy,
                    createdAt: log.createdAt,
                    updatedAt: log.updatedAt);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddStudent(
                      schoolData: schoolData,
                    ),
                  ),
                );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${log.name}',
                  style: PayNestTheme.title_2_16primaryColor.copyWith(
                    fontSize: sizes.fontRatio * 16,
                    fontWeight: FontWeight.bold,
                    color: PayNestTheme.black,
                  ),
                ),
                Text(
                  '${log.address}',
                  style: PayNestTheme.title_2_16primaryColor.copyWith(
                    fontSize: sizes.fontRatio * 13,
                    fontWeight: FontWeight.w300,
                    color: PayNestTheme.textGrey,
                  ),
                ),
              ],
            ),
          ),
          // Spacer(),
          // GestureDetector(
          //   onTap: () {
          //     schoolController.updateList(
          //       id: log.id,
          //     );
          //   },
          //   child: log.isSelected
          //       ? Lottie.asset(
          //           checkAnimation,
          //           height: sizes.heightRatio * 32,
          //           width: sizes.widthRatio * 32,
          //         )
          //       : Padding(
          //           padding: EdgeInsets.only(
          //             right: horizontalValue(8),
          //           ),
          //           child: Container(
          //             height: sizes.heightRatio * 16,
          //             width: sizes.widthRatio * 16,
          //             decoration: BoxDecoration(
          //               shape: BoxShape.circle,
          //               color: log.isSelected
          //                   ? Colors.green
          //                   : PayNestTheme.colorWhite,
          //               border: Border.all(
          //                 color: log.isSelected
          //                     ? Colors.transparent
          //                     : PayNestTheme.black.withOpacity(0.5),
          //               ),
          //             ),
          //           ),
          //         ),
          // ),
          // horizontalSpacer(8),
        ],
      ),
    );
  }
}
