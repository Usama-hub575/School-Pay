import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/school/select_school.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    student,
                    style: PayNestTheme.title_2_16primaryColor.copyWith(
                      fontWeight: FontWeight.bold,
                      color: PayNestTheme.colorWhite,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 52.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectSchool(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        size: 20.sp,
                        color: PayNestTheme.blueAccent,
                      ),
                      // child: Text(""),
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
                        topRight: Radius.circular(20)),
                    color: PayNestTheme.colorWhite),
                child: Obx(() => controller.isLoading.value == false
                    ? controller.myStudentData.value.status == true
                        ? controller.myStudentData.value.students == null
                            ? SizedBox()
                            // : ListView.builder(
                            //     shrinkWrap: true,
                            //     itemCount: controller
                            //         .myStudentData.value.students!.length,
                            //     itemBuilder: (context, index) {
                            //       if (controller.myStudentData.value
                            //               .students![index].student ==
                            //           null) {
                            //         return SizedBox.shrink();
                            //       } else {
                            //         if (index == 0) {
                            //           var isSchoolNull = controller
                            //               .myStudentData
                            //               .value
                            //               .students![index]
                            //               .student!
                            //               .school;
                            //           return Padding(
                            //             padding: EdgeInsets.symmetric(
                            //                 horizontal: 20.w),
                            //             child: Column(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: [
                            //                 SizedBox(
                            //                   height: 16.h,
                            //                 ),
                            //                 Text(
                            //                   selectStudent,
                            //                   style: PayNestTheme
                            //                       .title_2_16primaryColor
                            //                       .copyWith(
                            //                     fontWeight: FontWeight.bold,
                            //                     color:
                            //                         PayNestTheme.primaryColor,
                            //                   ),
                            //                 ),
                            //                 // ListTile(
                            //                 //   shape: RoundedRectangleBorder(
                            //                 //     borderRadius:
                            //                 //         BorderRadius.circular(12),
                            //                 //     side: BorderSide(
                            //                 //         width: 3.w,
                            //                 //         color: PayNestTheme
                            //                 //             .primaryColor),
                            //                 //   ),
                            //                 //   onTap: () {
                            //                 //     SingleStudentModel model = SingleStudentModel(
                            //                 //         id: controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .id,
                            //                 //         parentId: controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .parentId,
                            //                 //         studentId: controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .studentId,
                            //                 //         deletedAt: controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .deletedAt,
                            //                 //         createdAt: controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .createdAt,
                            //                 //         updatedAt: controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .updatedAt,
                            //                 //         student: Student(
                            //                 //             dob: controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .dob,
                            //                 //             admissionDate: controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .admissionDate,
                            //                 //             id: controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .id,
                            //                 //             studentRegNo: controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .studentRegNo,
                            //                 //             firstName: controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .firstName,
                            //                 //             lastName: controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .lastName,
                            //                 //             grade: controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .grade,
                            //                 //             parentEmiratesId: controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .parentEmiratesId,
                            //                 //             parentPhoneNumber: controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .parentPhoneNumber,
                            //                 //             deletedAt:
                            //                 //                 controller.myStudentData.value.students![index].student!.deletedAt,
                            //                 //             schoolId: controller.myStudentData.value.students![index].student!.schoolId,
                            //                 //             totalBalanceAmount: controller.myStudentData.value.students![index].student!.totalBalanceAmount,
                            //                 //             guardianFirstName: controller.myStudentData.value.students![index].student!.guardianFirstName,
                            //                 //             guardianLastName: controller.myStudentData.value.students![index].student!.guardianLastName,
                            //                 //             guardianGender: controller.myStudentData.value.students![index].student!.guardianGender,
                            //                 //             guardianEmiratesId: controller.myStudentData.value.students![index].student!.guardianEmiratesId,
                            //                 //             guardianNationality: controller.myStudentData.value.students![index].student!.guardianNationality,
                            //                 //             guardianReligion: controller.myStudentData.value.students![index].student!.guardianReligion,
                            //                 //             area: controller.myStudentData.value.students![index].student!.area,
                            //                 //             region: controller.myStudentData.value.students![index].student!.region,
                            //                 //             streetAddress: controller.myStudentData.value.students![index].student!.streetAddress,
                            //                 //             email: controller.myStudentData.value.students![index].student!.email,
                            //                 //             phoneNumber: controller.myStudentData.value.students![index].student!.phoneNumber,
                            //                 //             otherNumber: controller.myStudentData.value.students![index].student!.otherNumber,
                            //                 //             profile: controller.myStudentData.value.students![index].student!.profile,
                            //                 //             religion: controller.myStudentData.value.students![index].student!.religion,
                            //                 //             nationality: controller.myStudentData.value.students![index].student!.nationality,
                            //                 //             gender: controller.myStudentData.value.students![index].student!.gender,
                            //                 //             dueDate: controller.myStudentData.value.students![index].student!.dueDate,
                            //                 //             file: controller.myStudentData.value.students![index].student!.file,
                            //                 //             privacy: controller.myStudentData.value.students![index].student!.privacy,
                            //                 //             createdAt: controller.myStudentData.value.students![index].student!.createdAt,
                            //                 //             updatedAt: controller.myStudentData.value.students![index].student!.updatedAt,
                            //                 //             school: School(id: controller.myStudentData.value.students![index].student!.school!.id, name: controller.myStudentData.value.students![index].student!.school!.name, deletedAt: controller.myStudentData.value.students![index].student!.school!.deletedAt, addedBy: controller.myStudentData.value.students![index].student!.school!.addedBy, address: controller.myStudentData.value.students![index].student!.school!.address, description: controller.myStudentData.value.students![index].student!.school!.description, vat: controller.myStudentData.value.students![index].student!.school!.vat, paynestFee: controller.myStudentData.value.students![index].student!.school!.paynestFee, apiKey: controller.myStudentData.value.students![index].student!.school!.apiKey, merchantId: controller.myStudentData.value.students![index].student!.school!.merchantId, file: controller.myStudentData.value.students![index].student!.school!.file, privacy: controller.myStudentData.value.students![index].student!.school!.privacy, createdAt: controller.myStudentData.value.students![index].student!.school!.createdAt, updatedAt: controller.myStudentData.value.students![index].student!.school!.updatedAt)));
                            //                 //
                            //                 //     Navigator.of(context).push(
                            //                 //         MaterialPageRoute(
                            //                 //             builder: (context) =>
                            //                 //                 SingleStudentPage(
                            //                 //                     singleStudentModel:
                            //                 //                         model)));
                            //                 //   },
                            //                 //   leading: CircleAvatar(
                            //                 //     radius: 25.r,
                            //                 //     backgroundColor:
                            //                 //         PayNestTheme.primaryColor,
                            //                 //     child: Text(
                            //                 //         controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .firstName
                            //                 //                 .capitalize
                            //                 //                 .toString() +
                            //                 //             " " +
                            //                 //             controller
                            //                 //                 .myStudentData
                            //                 //                 .value
                            //                 //                 .students![index]
                            //                 //                 .student!
                            //                 //                 .lastName
                            //                 //                 .capitalize
                            //                 //                 .toString(),
                            //                 //         style: PayNestTheme
                            //                 //             .title_3_16white),
                            //                 //   ),
                            //                 //   title: Text(
                            //                 //     controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .student!
                            //                 //             .firstName
                            //                 //             .toString() +
                            //                 //         " " +
                            //                 //         controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .student!
                            //                 //             .lastName
                            //                 //             .toString(),
                            //                 //     style: PayNestTheme
                            //                 //         .title_3_16black,
                            //                 //   ),
                            //                 //   trailing:
                            //                 //       SvgPicture.asset(arrowNext),
                            //                 //   subtitle: Text(
                            //                 //     controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .student!
                            //                 //             .school!
                            //                 //             .name
                            //                 //             .isNotEmpty
                            //                 //         ? controller
                            //                 //             .myStudentData
                            //                 //             .value
                            //                 //             .students![index]
                            //                 //             .student!
                            //                 //             .school!
                            //                 //             .name
                            //                 //             .toString()
                            //                 //         : "",
                            //                 //     style:
                            //                 //         PayNestTheme.h2_14textGrey,
                            //                 //   ),
                            //                 // ),
                            //                 SizedBox(
                            //                   height: 16.h,
                            //                 ),
                            //               ],
                            //             ),
                            //           );
                            //         } else if (index != 0 &&
                            //             controller
                            //                     .myStudentData
                            //                     .value
                            //                     .students![index - 1]
                            //                     .student!
                            //                     .school!
                            //                     .id ==
                            //                 controller
                            //                     .myStudentData
                            //                     .value
                            //                     .students![index]
                            //                     .student!
                            //                     .school!
                            //                     .id) {
                            //           return Padding(
                            //             padding: EdgeInsets.symmetric(
                            //                 horizontal: 20.w),
                            //             child: Column(
                            //               children: [
                            //                 SizedBox(
                            //                   height: 16.h,
                            //                 ),
                            //                 ListTile(
                            //                   shape: RoundedRectangleBorder(
                            //                       borderRadius:
                            //                           BorderRadius.circular(12),
                            //                       side: BorderSide(
                            //                           width: 1.w,
                            //                           color: PayNestTheme
                            //                               .lineColor)),
                            //                   onTap: () {
                            //                     /// Passing Data ///
                            //                     SingleStudentModel model = SingleStudentModel(
                            //                         id: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .id,
                            //                         parentId: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .parentId,
                            //                         studentId: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .studentId,
                            //                         deletedAt: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .deletedAt,
                            //                         createdAt: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .createdAt,
                            //                         updatedAt: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .updatedAt,
                            //                         student: Student(
                            //                             dob: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .dob,
                            //                             admissionDate: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .admissionDate,
                            //                             id: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .id,
                            //                             studentRegNo: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .studentRegNo,
                            //                             firstName: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .firstName,
                            //                             lastName: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .lastName,
                            //                             grade: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .grade,
                            //                             parentEmiratesId: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .parentEmiratesId,
                            //                             parentPhoneNumber: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .parentPhoneNumber,
                            //                             deletedAt:
                            //                                 controller.myStudentData.value.students![index].student!.deletedAt,
                            //                             schoolId: controller.myStudentData.value.students![index].student!.schoolId,
                            //                             totalBalanceAmount: controller.myStudentData.value.students![index].student!.totalBalanceAmount,
                            //                             guardianFirstName: controller.myStudentData.value.students![index].student!.guardianFirstName,
                            //                             guardianLastName: controller.myStudentData.value.students![index].student!.guardianLastName,
                            //                             guardianGender: controller.myStudentData.value.students![index].student!.guardianGender,
                            //                             guardianEmiratesId: controller.myStudentData.value.students![index].student!.guardianEmiratesId,
                            //                             guardianNationality: controller.myStudentData.value.students![index].student!.guardianNationality,
                            //                             guardianReligion: controller.myStudentData.value.students![index].student!.guardianReligion,
                            //                             area: controller.myStudentData.value.students![index].student!.area,
                            //                             region: controller.myStudentData.value.students![index].student!.region,
                            //                             streetAddress: controller.myStudentData.value.students![index].student!.streetAddress,
                            //                             email: controller.myStudentData.value.students![index].student!.email,
                            //                             phoneNumber: controller.myStudentData.value.students![index].student!.phoneNumber,
                            //                             otherNumber: controller.myStudentData.value.students![index].student!.otherNumber,
                            //                             profile: controller.myStudentData.value.students![index].student!.profile,
                            //                             religion: controller.myStudentData.value.students![index].student!.religion,
                            //                             nationality: controller.myStudentData.value.students![index].student!.nationality,
                            //                             gender: controller.myStudentData.value.students![index].student!.gender,
                            //                             dueDate: controller.myStudentData.value.students![index].student!.dueDate,
                            //                             file: controller.myStudentData.value.students![index].student!.file,
                            //                             privacy: controller.myStudentData.value.students![index].student!.privacy,
                            //                             createdAt: controller.myStudentData.value.students![index].student!.createdAt,
                            //                             updatedAt: controller.myStudentData.value.students![index].student!.updatedAt,
                            //                             school: School(id: controller.myStudentData.value.students![index].student!.school!.id, name: controller.myStudentData.value.students![index].student!.school!.name, deletedAt: controller.myStudentData.value.students![index].student!.school!.deletedAt, addedBy: controller.myStudentData.value.students![index].student!.school!.addedBy, address: controller.myStudentData.value.students![index].student!.school!.address, description: controller.myStudentData.value.students![index].student!.school!.description, vat: controller.myStudentData.value.students![index].student!.school!.vat, paynestFee: controller.myStudentData.value.students![index].student!.school!.paynestFee, apiKey: controller.myStudentData.value.students![index].student!.school!.apiKey, merchantId: controller.myStudentData.value.students![index].student!.school!.merchantId, file: controller.myStudentData.value.students![index].student!.school!.file, privacy: controller.myStudentData.value.students![index].student!.school!.privacy, createdAt: controller.myStudentData.value.students![index].student!.school!.createdAt, updatedAt: controller.myStudentData.value.students![index].student!.school!.updatedAt)));
                            //
                            //                     Navigator.of(context).push(
                            //                         MaterialPageRoute(
                            //                             builder: (context) =>
                            //                                 SingleStudentPage(
                            //                                     singleStudentModel:
                            //                                         model)));
                            //                   },
                            //                   leading: CircleAvatar(
                            //                     radius: 25.r,
                            //                     backgroundColor:
                            //                         PayNestTheme.primaryColor,
                            //                     child: Text(
                            //                         controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .firstName
                            //                                 .capitalize
                            //                                 .toString() +
                            //                             " " +
                            //                             controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .lastName
                            //                                 .capitalize
                            //                                 .toString(),
                            //                         style: PayNestTheme
                            //                             .title_3_16white),
                            //                   ),
                            //                   title: Text(
                            //                     controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .student!
                            //                             .firstName
                            //                             .toString() +
                            //                         " " +
                            //                         controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .student!
                            //                             .lastName
                            //                             .toString(),
                            //                     style: PayNestTheme
                            //                         .title_3_16black,
                            //                   ),
                            //                   trailing:
                            //                       SvgPicture.asset(arrowNext),
                            //                   subtitle: Text(
                            //                     controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .student!
                            //                             .school!
                            //                             .name
                            //                             .isNotEmpty
                            //                         ? controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .student!
                            //                             .school!
                            //                             .name
                            //                             .toString()
                            //                         : "",
                            //                     style:
                            //                         PayNestTheme.h2_14textGrey,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 16.h,
                            //                 ),
                            //               ],
                            //             ),
                            //           );
                            //         } else {
                            //           return Padding(
                            //             padding: EdgeInsets.symmetric(
                            //                 horizontal: 20.w),
                            //             child: Column(
                            //               children: [
                            //                 SizedBox(
                            //                   height: 16.h,
                            //                 ),
                            //                 Container(
                            //                   height: 28.w,
                            //                   width: 1.sw,
                            //                   decoration: BoxDecoration(
                            //                       color:
                            //                           PayNestTheme.lineColor),
                            //                   child: Padding(
                            //                     padding: EdgeInsets.symmetric(
                            //                         horizontal: 20.w),
                            //                     child: Column(
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.center,
                            //                       children: [
                            //                         Text(
                            //                           controller
                            //                               .myStudentData
                            //                               .value
                            //                               .students![index]
                            //                               .student!
                            //                               .school!
                            //                               .name
                            //                               .toString(),
                            //                           style: PayNestTheme
                            //                               .small_2_12textGrey,
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 16.h,
                            //                 ),
                            //                 ListTile(
                            //                   shape: RoundedRectangleBorder(
                            //                       borderRadius:
                            //                           BorderRadius.circular(12),
                            //                       side: BorderSide(
                            //                           width: 1.w,
                            //                           color: PayNestTheme
                            //                               .lineColor)),
                            //                   onTap: () {
                            //                     /// Passing Data ///
                            //                     SingleStudentModel model = SingleStudentModel(
                            //                         id: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .id,
                            //                         parentId: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .parentId,
                            //                         studentId: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .studentId,
                            //                         deletedAt: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .deletedAt,
                            //                         createdAt: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .createdAt,
                            //                         updatedAt: controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .updatedAt,
                            //                         student: Student(
                            //                             dob: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .dob,
                            //                             admissionDate: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .admissionDate,
                            //                             id: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .id,
                            //                             studentRegNo: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .studentRegNo,
                            //                             firstName: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .firstName,
                            //                             lastName: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .lastName,
                            //                             grade: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .grade,
                            //                             parentEmiratesId: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .parentEmiratesId,
                            //                             parentPhoneNumber: controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .parentPhoneNumber,
                            //                             deletedAt:
                            //                                 controller.myStudentData.value.students![index].student!.deletedAt,
                            //                             schoolId: controller.myStudentData.value.students![index].student!.schoolId,
                            //                             totalBalanceAmount: controller.myStudentData.value.students![index].student!.totalBalanceAmount,
                            //                             guardianFirstName: controller.myStudentData.value.students![index].student!.guardianFirstName,
                            //                             guardianLastName: controller.myStudentData.value.students![index].student!.guardianLastName,
                            //                             guardianGender: controller.myStudentData.value.students![index].student!.guardianGender,
                            //                             guardianEmiratesId: controller.myStudentData.value.students![index].student!.guardianEmiratesId,
                            //                             guardianNationality: controller.myStudentData.value.students![index].student!.guardianNationality,
                            //                             guardianReligion: controller.myStudentData.value.students![index].student!.guardianReligion,
                            //                             area: controller.myStudentData.value.students![index].student!.area,
                            //                             region: controller.myStudentData.value.students![index].student!.region,
                            //                             streetAddress: controller.myStudentData.value.students![index].student!.streetAddress,
                            //                             email: controller.myStudentData.value.students![index].student!.email,
                            //                             phoneNumber: controller.myStudentData.value.students![index].student!.phoneNumber,
                            //                             otherNumber: controller.myStudentData.value.students![index].student!.otherNumber,
                            //                             profile: controller.myStudentData.value.students![index].student!.profile,
                            //                             religion: controller.myStudentData.value.students![index].student!.religion,
                            //                             nationality: controller.myStudentData.value.students![index].student!.nationality,
                            //                             gender: controller.myStudentData.value.students![index].student!.gender,
                            //                             dueDate: controller.myStudentData.value.students![index].student!.dueDate,
                            //                             file: controller.myStudentData.value.students![index].student!.file,
                            //                             privacy: controller.myStudentData.value.students![index].student!.privacy,
                            //                             createdAt: controller.myStudentData.value.students![index].student!.createdAt,
                            //                             updatedAt: controller.myStudentData.value.students![index].student!.updatedAt,
                            //                             school: School(id: controller.myStudentData.value.students![index].student!.school!.id, name: controller.myStudentData.value.students![index].student!.school!.name, deletedAt: controller.myStudentData.value.students![index].student!.school!.deletedAt, addedBy: controller.myStudentData.value.students![index].student!.school!.addedBy, address: controller.myStudentData.value.students![index].student!.school!.address, description: controller.myStudentData.value.students![index].student!.school!.description, vat: controller.myStudentData.value.students![index].student!.school!.vat, paynestFee: controller.myStudentData.value.students![index].student!.school!.paynestFee, apiKey: controller.myStudentData.value.students![index].student!.school!.apiKey, merchantId: controller.myStudentData.value.students![index].student!.school!.merchantId, file: controller.myStudentData.value.students![index].student!.school!.file, privacy: controller.myStudentData.value.students![index].student!.school!.privacy, createdAt: controller.myStudentData.value.students![index].student!.school!.createdAt, updatedAt: controller.myStudentData.value.students![index].student!.school!.updatedAt)));
                            //
                            //                     Navigator.of(context).push(
                            //                         MaterialPageRoute(
                            //                             builder: (context) =>
                            //                                 SingleStudentPage(
                            //                                     singleStudentModel:
                            //                                         model)));
                            //                   },
                            //                   leading: CircleAvatar(
                            //                     radius: 25.r,
                            //                     backgroundColor:
                            //                         PayNestTheme.primaryColor,
                            //                     child: Text(
                            //                         controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .firstName[0]
                            //                                 .capitalize
                            //                                 .toString() +
                            //                             " " +
                            //                             controller
                            //                                 .myStudentData
                            //                                 .value
                            //                                 .students![index]
                            //                                 .student!
                            //                                 .lastName[0]
                            //                                 .capitalize
                            //                                 .toString(),
                            //                         style: PayNestTheme
                            //                             .title_3_16white),
                            //                   ),
                            //                   title: Text(
                            //                     controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .student!
                            //                             .firstName
                            //                             .toString() +
                            //                         " " +
                            //                         controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .student!
                            //                             .lastName
                            //                             .toString(),
                            //                     style: PayNestTheme
                            //                         .title_3_16black,
                            //                   ),
                            //                   trailing:
                            //                       SvgPicture.asset(arrowNext),
                            //                   subtitle: Text(
                            //                     controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .student!
                            //                             .school!
                            //                             .name
                            //                             .isNotEmpty
                            //                         ? controller
                            //                             .myStudentData
                            //                             .value
                            //                             .students![index]
                            //                             .student!
                            //                             .school!
                            //                             .name
                            //                             .toString()
                            //                         : "",
                            //                     style:
                            //                         PayNestTheme.h2_14textGrey,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 16.h,
                            //                 ),
                            //               ],
                            //             ),
                            //           );
                            //         }
                            //       }
                            //     })
                            : SingleStudentCard(
                                onTap: (student) {
                                  // MaterialPageRoute(
                                  //   builder: (context) => SingleStudentPage(
                                  //       singleStudentModel: student),
                                  // );
                                },
                                students:
                                    controller.myStudentData.value.students!,
                              )
                        : SizedBox()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          CircularProgressIndicator(
                            backgroundColor: PayNestTheme.colorWhite,
                            color: PayNestTheme.blueAccent,
                          ),
                        ],
                      )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
