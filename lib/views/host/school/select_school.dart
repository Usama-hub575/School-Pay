import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';  
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/school_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/selectedschool_to_addstudent.dart';
import 'package:paynest_flutter_app/model/schoollist_model.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/addstudent/add_student.dart'
    as add_student;
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../widgets/back_button.dart';

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
      if (schoolDetail.name.toUpperCase().contains(text.toUpperCase())||
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
                                AppBarBackButton(
                                  iconColor: PayNestTheme.primaryColor,
                                  buttonColor: PayNestTheme.colorWhite,
                                ),
                                Text(
                                  selectSchool,
                                  style: PayNestTheme.title20white.copyWith(
                                    fontSize: sizes.fontRatio * 18,
                                  ),
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
                      style: PayNestTheme
                          .title_2_16primaryColor
                          .copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.black,
                      ),
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
                        hintStyle: PayNestTheme.small_2_12textGrey.copyWith(
                          fontSize: sizes.fontRatio * 13,
                          color: PayNestTheme.textGrey.withOpacity(0.3),
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
                                    log:_searchResult[index],
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
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: horizontalValue(20),
                                    ),
                                    width: 1.sw,
                                    height: 1,
                                    color: PayNestTheme.textGrey,
                                  ),
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
    return InkWell(
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
          updatedAt: log.updatedAt,
          payeeType: log.payeeType ?? '',
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => add_student.AddStudent(
              schoolData: schoolData,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                icSchoolBuilding,
              ),
            ),
            horizontalSpacer(13),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${log.name}',
                    style: PayNestTheme.title_2_16primaryColor.copyWith(
                      fontSize: sizes.fontRatio * 14,
                      fontWeight: FontWeight.bold,
                      color: PayNestTheme.black,
                    ),
                  ),
                  Text(
                    '${log.address}',
                    style: PayNestTheme.title_2_16primaryColor.copyWith(
                      fontSize: sizes.fontRatio * 10,
                      fontWeight: FontWeight.w300,
                      color: PayNestTheme.textGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
