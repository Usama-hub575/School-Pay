import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/school/select_school.dart';
import 'package:paynest_flutter_app/widgets/get_student_model.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../presentation/res/res.dart';
import '../../../widgets/inkwell_widget.dart';
import '../singlestudent/singlestudent_page.dart';
import 'widget/single_student_card.dart';

class StudentPage extends StatefulWidget {
  final String whichStack;

  StudentPage({required this.whichStack, Key? key}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final MyStudentController controller = Get.find<MyStudentController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: sizes.height,
        decoration: BoxDecoration(
          color: PayNestTheme.primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpacer(16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
                vertical: verticalValue(40),
              ),
              child: Row(
                children: [
                  widget.whichStack == "other"
                      ? Container(
                          height: 44.h,
                          width: 44.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2.0,
                                  offset: Offset(
                                    3.0, // Move to right 10  horizontally
                                    3.0, // Move to bottom 10 Vertically
                                  ),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r)),
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
                        )
                      : SizedBox(),
                  Spacer(),
                  Text(
                    student,
                    textAlign: TextAlign.center,
                    style: PayNestTheme.title_2_16primaryColor.copyWith(
                      color: PayNestTheme.colorWhite,
                      fontSize: sizes.fontRatio * 18,
                      fontFamily: 'montserratBold',
                    ),
                  ),
                  horizontalSpacer(82),
                  InkWellWidget(
                    onTap: () {
                      // AddStudentBottomSheet.show(
                      //   context: context,
                      // );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectSchool(),
                        ),
                      );
                    },
                    child: Container(
                      height: sizes.heightRatio * 40,
                      width: sizes.widthRatio * 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                      ),
                      child: Lottie.asset(
                        AppAssets().addStudentAnimation,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: PayNestTheme.colorWhite,
                ),
                child: Obx(
                  () => controller.isLoading.value == false
                      ? controller.myStudentData.value.status == true
                          ? controller.myStudentData.value.students == null ||
                                  controller
                                      .myStudentData.value.students!.isEmpty
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: horizontalValue(16),
                                  ),
                                  child: Column(
                                    children: [
                                      verticalSpacer(100),
                                      Container(
                                        width: sizes.widthRatio * 150,
                                        height: sizes.heightRatio * 150,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              AppAssets().noData,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      verticalSpacer(20),
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Text(
                                          noDataText,
                                          style: PayNestTheme
                                              .title_3_16blackbold
                                              .copyWith(
                                            fontSize: sizes.fontRatio * 22,
                                            color: PayNestTheme.primaryColor,
                                            fontFamily: 'montserratBold',
                                          ),
                                        ),
                                      ),
                                      verticalSpacer(10),
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Text(
                                          sorryWeCant,
                                          textAlign: TextAlign.center,
                                          style: PayNestTheme
                                              .title_3_16blackbold
                                              .copyWith(
                                            fontSize: sizes.fontRatio * 16,
                                            color: PayNestTheme.lightBlack,
                                            fontFamily: 'montserratBold',
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      verticalSpacer(16),
                                    ],
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpacer(16),
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: horizontalValue(24),
                                      ),
                                      child: Text(
                                        selectStudent,
                                        style: PayNestTheme.h2_12blueAccent
                                            .copyWith(
                                          fontSize: sizes.fontRatio * 16,
                                          color: PayNestTheme.primaryColor,
                                          fontFamily: 'montserratExtraBold',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleStudentCard(
                                        onTap: (student) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SingleStudentPage(
                                                studentId: student.studentId
                                                    .toString(),
                                                myStudentsRespModel:
                                                    getMyStudentModel(
                                                  element: student,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        students: controller
                                            .myStudentData.value.students!,
                                      ),
                                    ),
                                  ],
                                )
                          : Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalValue(16),
                              ),
                              child: Column(
                                children: [
                                  verticalSpacer(100),
                                  Container(
                                    width: sizes.widthRatio * 150,
                                    height: sizes.heightRatio * 150,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          AppAssets().warning,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  verticalSpacer(20),
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Text(
                                      error,
                                      style: PayNestTheme.title_3_16blackbold
                                          .copyWith(
                                        fontSize: sizes.fontRatio * 22,
                                        color: PayNestTheme.primaryColor,
                                        fontFamily: 'montserratBold',
                                      ),
                                    ),
                                  ),
                                  verticalSpacer(10),
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Text(
                                      sorryWeCant,
                                      textAlign: TextAlign.center,
                                      style: PayNestTheme.title_3_16blackbold
                                          .copyWith(
                                        fontSize: sizes.fontRatio * 16,
                                        color: PayNestTheme.lightBlack,
                                        fontFamily: 'montserratBold',
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  verticalSpacer(16),
                                ],
                              ),
                            )
                      : Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalValue(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpacer(16),
                              FadeShimmer(
                                width: sizes.widthRatio * 85,
                                height: sizes.heightRatio * 20,
                                baseColor: Color(0xFFEBEBF4),
                                highlightColor: Color(0xFFF4F4F4),
                                radius: 10,
                              ),
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: horizontalValue(4),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: horizontalValue(6),
                                      ),
                                      child: FadeShimmer(
                                        width: sizes.widthRatio * 10,
                                        height: sizes.heightRatio * 70,
                                        // fadeTheme: FadeTheme.dark,
                                        baseColor: Color(0xFFEBEBF4),
                                        highlightColor: Color(0xFFF4F4F4),
                                        radius: 16,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return verticalSpacer(6);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SingleStudentModel getStudentModel({
  //   required StudentElement studentElement,
  // }) {
  //   return SingleStudentModel(
  //     id: studentElement.id,
  //     parentId: studentElement.parentId,
  //     studentId: studentElement.studentId,
  //     deletedAt: studentElement.deletedAt,
  //     createdAt: studentElement.createdAt,
  //     updatedAt: studentElement.updatedAt,
  //     student: Student(
  //       dob: studentElement.student!.dob,
  //       admissionDate: studentElement.student!.admissionDate,
  //       id: studentElement.student!.id,
  //       studentRegNo: studentElement.student!.studentRegNo,
  //       firstName: studentElement.student!.firstName,
  //       lastName: studentElement.student!.lastName,
  //       grade: studentElement.student!.grade,
  //       parentEmiratesId: studentElement.student!.parentEmiratesId,
  //       parentPhoneNumber: studentElement.student!.parentPhoneNumber,
  //       deletedAt: studentElement.student!.deletedAt,
  //       schoolId: studentElement.student!.schoolId,
  //       totalBalanceAmount:
  //       double.parse(studentElement.student!.totalBalanceAmount.toString()),
  //       guardianFirstName: studentElement.student!.guardianFirstName,
  //       guardianLastName: studentElement.student!.guardianLastName,
  //       guardianGender: studentElement.student!.guardianGender,
  //       guardianEmiratesId: studentElement.student!.guardianEmiratesId,
  //       guardianNationality: studentElement.student!.guardianNationality,
  //       guardianReligion: studentElement.student!.guardianReligion,
  //       area: studentElement.student!.area,
  //       region: studentElement.student!.region,
  //       streetAddress: studentElement.student!.streetAddress,
  //       email: studentElement.student!.email,
  //       phoneNumber: studentElement.student!.phoneNumber,
  //       otherNumber: studentElement.student!.otherNumber,
  //       profile: studentElement.student!.profile,
  //       religion: studentElement.student!.religion,
  //       nationality: studentElement.student!.nationality,
  //       gender: studentElement.student!.gender,
  //       dueDate: studentElement.student!.dueDate,
  //       file: studentElement.student!.file,
  //       privacy: studentElement.student!.privacy,
  //       createdAt: studentElement.student!.createdAt,
  //       updatedAt: studentElement.student!.updatedAt,
  //       school: School(
  //         id: studentElement.student!.school!.id,
  //         name: studentElement.student!.school!.name,
  //         deletedAt: studentElement.student!.school!.deletedAt,
  //         addedBy: studentElement.student!.school!.addedBy,
  //         address: studentElement.student!.school!.address,
  //         description: studentElement.student!.school!.description,
  //         vat: studentElement.student!.school!.vat,
  //         paynestFee: studentElement.student!.school!.paynestFee,
  //         apiKey: studentElement.student!.school!.apiKey,
  //         merchantId: studentElement.student!.school!.merchantId,
  //         file: studentElement.student!.school!.file,
  //         privacy: studentElement.student!.school!.privacy,
  //         createdAt: studentElement.student!.school!.createdAt,
  //         updatedAt: studentElement.student!.school!.updatedAt,
  //       ),
  //     ),
  //   );
  // }
}
