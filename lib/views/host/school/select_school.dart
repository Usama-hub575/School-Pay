import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/school_controller.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/addstudent/add_student.dart'
    as add_student;
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../data/model/response/school_list/school_list_response_model.dart';
import '../../../data/model/response/school_list/selected_school_to_add_student.dart';
import '../../../presentation/res/res.dart';
import '../../../widgets/back_button.dart';

class SelectSchool extends StatefulWidget {
  const SelectSchool({Key? key}) : super(key: key);

  @override
  State<SelectSchool> createState() => _SelectSchoolState();
}

class _SelectSchoolState extends State<SelectSchool> {
  SchoolController schoolController = Get.put(SchoolController());
  TextEditingController ssController = TextEditingController();
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
    schoolController.hitSchoolList();
  }

  onSearchTextChanged(String text) {
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

  final List<Log> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Obx(
        () => Column(
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
            !schoolController.isLoading.value
                ? Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(16),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      onTap: () {
                        onSearchTextChanged('');
                      },
                      controller: ssController,
                      onChanged: onSearchTextChanged,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
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
                  )
                : Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: horizontalValue(16),
                    ),
                    child: FadeShimmer(
                      width: double.infinity,
                      height: sizes.heightRatio * 50,
                      // fadeTheme: FadeTheme.dark,
                      baseColor: const Color(0xFFEBEBF4),
                      highlightColor: const Color(0xFFF4F4F4),
                      radius: 16,
                    ),
                  ),
            !schoolController.isLoading.value
                ? _searchResult.isNotEmpty || ssController.text.isNotEmpty
                    ? Expanded(
                        child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _searchResult.isNotEmpty &&
                                  ssController.text.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _searchResult.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        _singleCard(
                                          log: _searchResult[index],
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
                                )
                              : Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    noDataText,
                                    style: PayNestTheme.title_3_16blackbold
                                        .copyWith(
                                      fontSize: sizes.fontRatio * 22,
                                      color: PayNestTheme.primaryColor,
                                      fontFamily: 'montserratBold',
                                    ),
                                  ),
                                ),
                        ],
                      ))
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              schoolController.schoolResList.value.log!.length,
                          physics: const BouncingScrollPhysics(),
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
                      )
                : Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                        vertical: verticalValue(12),
                      ),
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FadeShimmer.round(
                              size: sizes.heightRatio * 50,
                              baseColor: const Color(0xFFEBEBF4),
                              highlightColor: const Color(0xFFF4F4F4),
                            ),
                            horizontalSpacer(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpacer(10),
                                FadeShimmer(
                                  width: sizes.widthRatio * 250,
                                  height: sizes.heightRatio * 20,
                                  baseColor: const Color(0xFFEBEBF4),
                                  highlightColor: const Color(0xFFF4F4F4),
                                  radius: 8,
                                ),
                                verticalSpacer(8),
                                FadeShimmer(
                                  width: sizes.widthRatio * 70,
                                  height: sizes.heightRatio * 20,
                                  baseColor: const Color(0xFFEBEBF4),
                                  highlightColor: const Color(0xFFF4F4F4),
                                  radius: 10,
                                ),
                                verticalSpacer(6),
                              ],
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return FadeShimmer(
                          height: 1,
                          width: sizes.widthRatio * 250,
                          baseColor: const Color(0xFFEBEBF4),
                          highlightColor: const Color(0xFFF4F4F4),
                          // radius: 10,
                        );
                      },
                    ),
                  )
          ],
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppAssets().icSchoolBuilding,
              ),
            ),
            horizontalSpacer(13),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    log.name,
                    style: PayNestTheme.title_2_16primaryColor.copyWith(
                      fontSize: sizes.fontRatio * 14,
                      fontWeight: FontWeight.bold,
                      color: PayNestTheme.black,
                    ),
                  ),
                  Text(
                    log.address,
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
