import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/school/select_school.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../model/datamodel/singlestudent_model.dart';
import '../dashboard/widgets/add_student_bottom_sheet.dart';
import '../singlestudent/singlestudent_page.dart';
import 'widget/single_student_card.dart';
import '../../../model/mystudents_resp_model.dart' as studentElement;

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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back,
                                size: 20.sp, color: PayNestTheme.blueAccent),
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
                  Container(
                    height: sizes.heightRatio * 40,
                    width: sizes.widthRatio * 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: IconButton(
                      onPressed: () {
                        AddStudentBottomSheet.show(
                          context: context,
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        size: 20.sp,
                        color: PayNestTheme.blueAccent,
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
                child: Obx(() => controller.isLoading.value == false
                    ? controller.myStudentData.value.status == true
                        ? controller.myStudentData.value.students == null ||
                                controller.myStudentData.value.students!.isEmpty
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
                                            noData,
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
                                      style:
                                          PayNestTheme.h2_12blueAccent.copyWith(
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
                                              singleStudentModel:
                                                  getStudentModel(
                                                studentElement: student,
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
                                        warning,
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
                          children: [
                            const Spacer(),
                            CircularProgressIndicator(
                              backgroundColor: PayNestTheme.colorWhite,
                              color: PayNestTheme.blueAccent,
                            ),
                            const Spacer(),
                          ],
                        ),
                      )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleStudentModel getStudentModel({
    required studentElement.StudentElement studentElement,
  }) {
    return SingleStudentModel(
      id: studentElement.id,
      parentId: studentElement.parentId,
      studentId: studentElement.studentId,
      deletedAt: studentElement.deletedAt,
      createdAt: studentElement.createdAt,
      updatedAt: studentElement.updatedAt,
      student: Student(
        dob: studentElement.student!.dob,
        admissionDate: studentElement.student!.admissionDate,
        id: studentElement.student!.id,
        studentRegNo: studentElement.student!.studentRegNo,
        firstName: studentElement.student!.firstName,
        lastName: studentElement.student!.lastName,
        grade: studentElement.student!.grade,
        parentEmiratesId: studentElement.student!.parentEmiratesId,
        parentPhoneNumber: studentElement.student!.parentPhoneNumber,
        deletedAt: studentElement.student!.deletedAt,
        schoolId: studentElement.student!.schoolId,
        totalBalanceAmount:
            double.parse(studentElement.student!.totalBalanceAmount.toString()),
        guardianFirstName: studentElement.student!.guardianFirstName,
        guardianLastName: studentElement.student!.guardianLastName,
        guardianGender: studentElement.student!.guardianGender,
        guardianEmiratesId: studentElement.student!.guardianEmiratesId,
        guardianNationality: studentElement.student!.guardianNationality,
        guardianReligion: studentElement.student!.guardianReligion,
        area: studentElement.student!.area,
        region: studentElement.student!.region,
        streetAddress: studentElement.student!.streetAddress,
        email: studentElement.student!.email,
        phoneNumber: studentElement.student!.phoneNumber,
        otherNumber: studentElement.student!.otherNumber,
        profile: studentElement.student!.profile,
        religion: studentElement.student!.religion,
        nationality: studentElement.student!.nationality,
        gender: studentElement.student!.gender,
        dueDate: studentElement.student!.dueDate,
        file: studentElement.student!.file,
        privacy: studentElement.student!.privacy,
        createdAt: studentElement.student!.createdAt,
        updatedAt: studentElement.student!.updatedAt,
        school: School(
          id: studentElement.student!.school!.id,
          name: studentElement.student!.school!.name,
          deletedAt: studentElement.student!.school!.deletedAt,
          addedBy: studentElement.student!.school!.addedBy,
          address: studentElement.student!.school!.address,
          description: studentElement.student!.school!.description,
          vat: studentElement.student!.school!.vat,
          paynestFee: studentElement.student!.school!.paynestFee,
          apiKey: studentElement.student!.school!.apiKey,
          merchantId: studentElement.student!.school!.merchantId,
          file: studentElement.student!.school!.file,
          privacy: studentElement.student!.school!.privacy,
          createdAt: studentElement.student!.school!.createdAt,
          updatedAt: studentElement.student!.school!.updatedAt,
        ),
      ),
    );
  }
}
