import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/assistance/get_assistance.dart';
import 'package:paynest_flutter_app/views/host/changepin/change_pin.dart';
import 'package:paynest_flutter_app/views/host/notification/notification_page.dart';
import 'package:paynest_flutter_app/views/host/pay/paynow_page.dart';
import 'package:paynest_flutter_app/views/host/pendingtask/pending_task.dart';
import 'package:paynest_flutter_app/views/host/school/select_school.dart';
import 'package:paynest_flutter_app/views/host/singlestudent/singlestudent_page.dart';
import 'package:paynest_flutter_app/views/host/student/student_page.dart';
import 'package:paynest_flutter_app/widgets/mycarousel_slider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // final RegisterController rc = Get.find<RegisterController>();
  // final LoginController lc = Get.put(LoginController());
  final UserController lc = Get.put(UserController());
  final MyStudentController myStudentController =
      Get.put(MyStudentController());

  // var variable;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStudents();
    // if(lc.registerResData.value.status == true){
    //   setState(() {
    //     variable = lc.registerResData.value;
    //   });
    // }else if(lc.loginResData.value.status == true){
    //   setState(() {
    //     variable = lc.loginResData.value;
    //   });
    // }
  }

  fetchStudents() async {
    await myStudentController.hitMyStudents(lc.userResData.value.parent!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // lc.loginResData.value.status ?
            Column(
      children: [
        Container(
          height: 129.h,
          decoration: BoxDecoration(
              color: PayNestTheme.primaryColor,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(24.r))),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        welcome,
                        style: PayNestTheme.title20white,
                      ),
                      Obx(() => Text(
                            lc.userResData.value.parent!.firstName.toString(),
                            style: PayNestTheme.subtitle16white,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 44.h,
                        width: 44.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NotificationPage()));
                            },
                            icon: Image.asset(
                              ic_bell,
                              height: 20.sp,
                            )
                            // child: Text(""),
                            ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Container(
                        height: 44.h,
                        width: 44.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(12.r))),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => GetAssistance()));
                          },
                          icon: SvgPicture.asset(
                            faq,
                            semanticsLabel: paynest,
                            height: 20.sp,
                            color: PayNestTheme.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //header end

        CarouselSliderPage(),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 23.3.h, bottom: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pendingTask,
                        style: PayNestTheme.title_2_16primaryColor,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PendingTask()));
                          },
                          child: Text(
                            showAll,
                            style: PayNestTheme.h2_12blueAccent,
                          )),
                    ],
                  ),
                  SizedBox(height: 10.5.h),
                  Obx(() => lc.userResData.value.parent!.pin == null
                      ? SizedBox(
                          height: 48.h,
                          width: 326.w,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChangePIN()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  setPIN,
                                  style: PayNestTheme.title_3_16black,
                                ),
                                SvgPicture.asset(
                                  arrowNext,
                                  height: 20.sp,
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox()),
                  SizedBox(height: 10.5.h),
                  Obx(() => lc.userResData.value.parent!.paymentConfigured ==
                              null ||
                          lc.userResData.value.parent!.paymentConfigured ==
                              false
                      ? SizedBox(
                          height: 48.h,
                          width: 326.w,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      PayNowPage(whichStack: "other")));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  makeFirstPayment,
                                  style: PayNestTheme.title_3_16black,
                                ),
                                SvgPicture.asset(
                                  arrowNext,
                                  height: 20.sp,
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(top: 18.5.h, bottom: 11.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          student,
                          style: PayNestTheme.title_2_16primaryColor,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StudentPage(
                                        whichStack: "other",
                                      )));
                            },
                            child: Text(
                              showAll,
                              style: PayNestTheme.h2_12blueAccent,
                            )),
                      ],
                    ),
                  ),
                  Obx(
                    () =>
                        myStudentController.myStudentData.value.students != null
                            ? Container(
                                height: 200.h,
                                child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (context, index) =>
                                            index !=
                                                    myStudentController
                                                        .myStudentData
                                                        .value
                                                        .students!
                                                        .length
                                                ? myStudentController
                                                        .myStudentData
                                                        .value
                                                        .status
                                                    ? myStudentController
                                                                .myStudentData
                                                                .value
                                                                .students![
                                                                    index]
                                                                .student ==
                                                            null
                                                        ? SizedBox.shrink()
                                                        : InkWell(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                SingleStudentModel model = SingleStudentModel(
                                                                    id: myStudentController
                                                                        .myStudentData
                                                                        .value
                                                                        .students![
                                                                            index]
                                                                        .id,
                                                                    parentId: myStudentController
                                                                        .myStudentData
                                                                        .value
                                                                        .students![
                                                                            index]
                                                                        .parentId,
                                                                    studentId: myStudentController
                                                                        .myStudentData
                                                                        .value
                                                                        .students![
                                                                            index]
                                                                        .studentId,
                                                                    deletedAt: myStudentController
                                                                        .myStudentData
                                                                        .value
                                                                        .students![
                                                                            index]
                                                                        .deletedAt,
                                                                    createdAt: myStudentController
                                                                        .myStudentData
                                                                        .value
                                                                        .students![
                                                                            index]
                                                                        .createdAt,
                                                                    updatedAt: myStudentController
                                                                        .myStudentData
                                                                        .value
                                                                        .students![
                                                                            index]
                                                                        .updatedAt,
                                                                    student: Student(
                                                                        dob: myStudentController
                                                                            .myStudentData
                                                                            .value
                                                                            .students![
                                                                                index]
                                                                            .student!
                                                                            .dob,
                                                                        admissionDate: myStudentController
                                                                            .myStudentData
                                                                            .value
                                                                            .students![index]
                                                                            .student!
                                                                            .admissionDate,
                                                                        id: myStudentController.myStudentData.value.students![index].student!.id,
                                                                        studentRegNo: myStudentController.myStudentData.value.students![index].student!.studentRegNo,
                                                                        firstName: myStudentController.myStudentData.value.students![index].student!.firstName,
                                                                        lastName: myStudentController.myStudentData.value.students![index].student!.lastName,
                                                                        grade: myStudentController.myStudentData.value.students![index].student!.grade,
                                                                        parentEmiratesId: myStudentController.myStudentData.value.students![index].student!.parentEmiratesId,
                                                                        parentPhoneNumber: myStudentController.myStudentData.value.students![index].student!.parentPhoneNumber,
                                                                        deletedAt: myStudentController.myStudentData.value.students![index].student!.deletedAt,
                                                                        schoolId: myStudentController.myStudentData.value.students![index].student!.schoolId,
                                                                        totalBalanceAmount: myStudentController.myStudentData.value.students![index].student!.totalBalanceAmount,
                                                                        guardianFirstName: myStudentController.myStudentData.value.students![index].student!.guardianFirstName,
                                                                        guardianLastName: myStudentController.myStudentData.value.students![index].student!.guardianLastName,
                                                                        guardianGender: myStudentController.myStudentData.value.students![index].student!.guardianGender,
                                                                        guardianEmiratesId: myStudentController.myStudentData.value.students![index].student!.guardianEmiratesId,
                                                                        guardianNationality: myStudentController.myStudentData.value.students![index].student!.guardianNationality,
                                                                        guardianReligion: myStudentController.myStudentData.value.students![index].student!.guardianReligion,
                                                                        area: myStudentController.myStudentData.value.students![index].student!.area,
                                                                        region: myStudentController.myStudentData.value.students![index].student!.region,
                                                                        streetAddress: myStudentController.myStudentData.value.students![index].student!.streetAddress,
                                                                        email: myStudentController.myStudentData.value.students![index].student!.email,
                                                                        phoneNumber: myStudentController.myStudentData.value.students![index].student!.phoneNumber,
                                                                        otherNumber: myStudentController.myStudentData.value.students![index].student!.otherNumber,
                                                                        profile: myStudentController.myStudentData.value.students![index].student!.profile,
                                                                        religion: myStudentController.myStudentData.value.students![index].student!.religion,
                                                                        nationality: myStudentController.myStudentData.value.students![index].student!.nationality,
                                                                        gender: myStudentController.myStudentData.value.students![index].student!.gender,
                                                                        dueDate: myStudentController.myStudentData.value.students![index].student!.dueDate,
                                                                        file: myStudentController.myStudentData.value.students![index].student!.file,
                                                                        privacy: myStudentController.myStudentData.value.students![index].student!.privacy,
                                                                        createdAt: myStudentController.myStudentData.value.students![index].student!.createdAt,
                                                                        updatedAt: myStudentController.myStudentData.value.students![index].student!.updatedAt,
                                                                        school: School(id: myStudentController.myStudentData.value.students![index].student!.school!.id, name: myStudentController.myStudentData.value.students![index].student!.school!.name, deletedAt: myStudentController.myStudentData.value.students![index].student!.school!.deletedAt, addedBy: myStudentController.myStudentData.value.students![index].student!.school!.addedBy, address: myStudentController.myStudentData.value.students![index].student!.school!.address, description: myStudentController.myStudentData.value.students![index].student!.school!.description, vat: myStudentController.myStudentData.value.students![index].student!.school!.vat, paynestFee: myStudentController.myStudentData.value.students![index].student!.school!.paynestFee, apiKey: myStudentController.myStudentData.value.students![index].student!.school!.apiKey, merchantId: myStudentController.myStudentData.value.students![index].student!.school!.merchantId, file: myStudentController.myStudentData.value.students![index].student!.school!.file, privacy: myStudentController.myStudentData.value.students![index].student!.school!.privacy, createdAt: myStudentController.myStudentData.value.students![index].student!.school!.createdAt, updatedAt: myStudentController.myStudentData.value.students![index].student!.school!.updatedAt)));
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                SingleStudentPage(singleStudentModel: model)));
                                                              },
                                                              child: Container(
                                                                height: 230.h,
                                                                width: 156.w,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    border: Border.all(
                                                                        color: PayNestTheme
                                                                            .borderGrey,
                                                                        width:
                                                                            1)),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical: 11
                                                                              .h,
                                                                          horizontal:
                                                                              10.w),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SvgPicture.asset(
                                                                              ic_studentAvatar,
                                                                              height: 50.sp),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 8.21.h, bottom: 8.h),
                                                                            child:
                                                                                Text(
                                                                              myStudentController.myStudentData.value.students![index].student!.firstName + " " + myStudentController.myStudentData.value.students![index].student!.lastName,
                                                                              style: PayNestTheme.small_14black,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            myStudentController.myStudentData.value.students![index].student!.school!.name,
                                                                            style:
                                                                                PayNestTheme.small_2_12textGrey,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                15.h,
                                                                          ),

                                                                          /// Check Paid or Unpaid ///
                                                                          myStudentController.myStudentData.value.students![index].student!.totalBalanceAmount != "0" || myStudentController.myStudentData.value.students![index].student!.totalBalanceAmount.isNotEmpty
                                                                              ? Container(
                                                                                  height: 18.h,
                                                                                  width: 50.79.w,
                                                                                  decoration: BoxDecoration(
                                                                                    color: PayNestTheme.paidGreen,
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                  ),
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                    paid,
                                                                                    style: PayNestTheme.small_2_12white,
                                                                                  )),
                                                                                )
                                                                              : Container(
                                                                                  height: 18.h,
                                                                                  width: 50.79.w,
                                                                                  decoration: BoxDecoration(
                                                                                    color: PayNestTheme.red,
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                  ),
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                    dues,
                                                                                    style: PayNestTheme.small_2_12white,
                                                                                  )),
                                                                                ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          1.sw,
                                                                      height:
                                                                          1.h,
                                                                      color: PayNestTheme
                                                                          .borderGrey,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              8.0.h),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            view,
                                                                            style:
                                                                                PayNestTheme.h2_14blueAccent,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5.w,
                                                                          ),
                                                                          SvgPicture.asset(
                                                                              arrowNext),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                    : SizedBox.shrink()
                                                : Center(
                                                  child: SizedBox(
                                                      height: 230.h,
                                                      width: 156.w,
                                                      child: OutlinedButton(
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          // backgroundColor:Colors.blue,
                                                          elevation: 0,
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: PayNestTheme
                                                                  .borderGrey),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          SelectSchool()));
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 32.h,
                                                              width: 32.w,
                                                              decoration: BoxDecoration(
                                                                  color: PayNestTheme
                                                                      .blueAccent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.r)),
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder:
                                                                              (context) =>
                                                                                  SelectSchool()));
                                                                },
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 14.sp,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15.h,
                                                            ),
                                                            Text(
                                                              addStudent,
                                                              style: PayNestTheme
                                                                  .h2_14blueAccent,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ),
                                    separatorBuilder: (_, index) => SizedBox(
                                          width: 14.w,
                                        ),
                                    itemCount: myStudentController.myStudentData
                                            .value.students!.length +
                                        1),
                              )
                            : SizedBox(
                                height: 230.h,
                                width: 156.w,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    // backgroundColor:Colors.blue,
                                    elevation: 0,
                                    side: BorderSide(
                                        width: 1,
                                        color: PayNestTheme.borderGrey),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SelectSchool()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 32.h,
                                        width: 32.w,
                                        decoration: BoxDecoration(
                                            color: PayNestTheme.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SelectSchool()));
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 14.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        addStudent,
                                        style: PayNestTheme.h2_14blueAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                  ),
                  // Obx(() =>
                  //     Row(
                  //       children: [
                  //         //if some got some students
                  //         myStudentController.myStudentData.value.status
                  //             ? InkWell(
                  //           child: GestureDetector(
                  //             onTap: () {
                  //               SingleStudentModel model = SingleStudentModel(
                  //                   id: myStudentController.myStudentData
                  //                       .value.students![0].id,
                  //                   parentId: myStudentController
                  //                       .myStudentData
                  //                       .value
                  //                       .students![0]
                  //                       .parentId,
                  //                   studentId: myStudentController
                  //                       .myStudentData
                  //                       .value
                  //                       .students![0]
                  //                       .studentId,
                  //                   deletedAt: myStudentController
                  //                       .myStudentData
                  //                       .value
                  //                       .students![0]
                  //                       .deletedAt,
                  //                   createdAt: myStudentController
                  //                       .myStudentData
                  //                       .value
                  //                       .students![0]
                  //                       .createdAt,
                  //                   updatedAt: myStudentController
                  //                       .myStudentData
                  //                       .value
                  //                       .students![0]
                  //                       .updatedAt,
                  //                   student:
                  //                   Student(dob: myStudentController
                  //                       .myStudentData.value.students![0]
                  //                       .student!.dob,
                  //                       admissionDate: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .admissionDate,
                  //                       id: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.id,
                  //                       studentRegNo: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .studentRegNo,
                  //                       firstName: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .firstName,
                  //                       lastName: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.lastName,
                  //                       grade: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.grade,
                  //                       parentEmiratesId: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .parentEmiratesId,
                  //                       parentPhoneNumber: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .parentPhoneNumber,
                  //                       deletedAt: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .deletedAt,
                  //                       schoolId: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.schoolId,
                  //                       totalBalanceAmount: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .totalBalanceAmount,
                  //                       guardianFirstName: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .guardianFirstName,
                  //                       guardianLastName: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .guardianLastName,
                  //                       guardianGender: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .guardianGender,
                  //                       guardianEmiratesId: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .guardianEmiratesId,
                  //                       guardianNationality: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .guardianNationality,
                  //                       guardianReligion: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .guardianReligion,
                  //                       area: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.area,
                  //                       region: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.region,
                  //                       streetAddress: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .streetAddress,
                  //                       email: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.email,
                  //                       phoneNumber: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .phoneNumber,
                  //                       otherNumber: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .otherNumber,
                  //                       profile: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.profile,
                  //                       religion: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.religion,
                  //                       nationality: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .nationality,
                  //                       gender: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.gender,
                  //                       dueDate: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.dueDate,
                  //                       file: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.file,
                  //                       privacy: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!.privacy,
                  //                       createdAt: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .createdAt,
                  //                       updatedAt: myStudentController
                  //                           .myStudentData.value
                  //                           .students![0].student!
                  //                           .updatedAt,
                  //                       school: School(
                  //                           id: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.id,
                  //                           name: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.name,
                  //                           deletedAt: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.deletedAt,
                  //                           addedBy: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.addedBy,
                  //                           address: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.address,
                  //                           description: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.description,
                  //                           vat: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.vat,
                  //                           paynestFee: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.paynestFee,
                  //                           apiKey: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.apiKey,
                  //                           merchantId: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.merchantId,
                  //                           file: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.file,
                  //                           privacy: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.privacy,
                  //                           createdAt: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.createdAt,
                  //                           updatedAt: myStudentController
                  //                               .myStudentData.value
                  //                               .students![0].student!
                  //                               .school!.updatedAt)));
                  //               Navigator.of(context).push(
                  //                   MaterialPageRoute(
                  //                       builder: (context) =>
                  //                           SingleStudentPage(
                  //                               singleStudentModel:
                  //                               model)));
                  //             },
                  //             child: Container(
                  //               height: 230.h,
                  //               width: 156.w,
                  //               decoration: BoxDecoration(
                  //                   borderRadius:
                  //                   BorderRadius.circular(12),
                  //                   border: Border.all(
                  //                       color: PayNestTheme.borderGrey,
                  //                       width: 1)),
                  //               child: Column(
                  //                 crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //                 mainAxisAlignment:
                  //                 MainAxisAlignment.center,
                  //                 children: [
                  //                   Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                         vertical: 11.h,
                  //                         horizontal: 10.w),
                  //                     child: Column(
                  //                       mainAxisAlignment:
                  //                       MainAxisAlignment.start,
                  //                       crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                       children: [
                  //                         SvgPicture.asset(
                  //                             ic_studentAvatar,
                  //                             height: 50.sp),
                  //                         Padding(
                  //                           padding: EdgeInsets.only(
                  //                               top: 8.21.h, bottom: 8.h),
                  //                           child: Text(
                  //                             myStudentController
                  //                                 .myStudentData
                  //                                 .value
                  //                                 .students![0]
                  //                                 .student!
                  //                                 .firstName +
                  //                                 " " +
                  //                                 myStudentController
                  //                                     .myStudentData
                  //                                     .value
                  //                                     .students![0]
                  //                                     .student!
                  //                                     .lastName,
                  //                             style: PayNestTheme
                  //                                 .small_14black,
                  //                           ),
                  //                         ),
                  //                         Text(
                  //                           myStudentController
                  //                               .myStudentData
                  //                               .value
                  //                               .students![0]
                  //                               .student!
                  //                               .school!
                  //                               .name,
                  //                           style: PayNestTheme
                  //                               .small_2_12textGrey,
                  //                         ),
                  //                         SizedBox(
                  //                           height: 15.h,
                  //                         ),
                  //
                  //                         /// Check Paid or Unpaid ///
                  //                         myStudentController
                  //                             .myStudentData
                  //                             .value
                  //                             .students![0]
                  //                             .student!
                  //                             .totalBalanceAmount !=
                  //                             "0" ||
                  //                             myStudentController
                  //                                 .myStudentData
                  //                                 .value
                  //                                 .students![0]
                  //                                 .student!
                  //                                 .totalBalanceAmount
                  //                                 .isNotEmpty
                  //                             ? Container(
                  //                           height: 18.h,
                  //                           width: 50.79.w,
                  //                           decoration:
                  //                           BoxDecoration(
                  //                             color: PayNestTheme
                  //                                 .paidGreen,
                  //                             borderRadius:
                  //                             BorderRadius
                  //                                 .circular(5),
                  //                           ),
                  //                           child: Center(
                  //                               child: Text(
                  //                                 paid,
                  //                                 style: PayNestTheme
                  //                                     .small_2_12white,
                  //                               )),
                  //                         )
                  //                             : Container(
                  //                           height: 18.h,
                  //                           width: 50.79.w,
                  //                           decoration:
                  //                           BoxDecoration(
                  //                             color:
                  //                             PayNestTheme.red,
                  //                             borderRadius:
                  //                             BorderRadius
                  //                                 .circular(5),
                  //                           ),
                  //                           child: Center(
                  //                               child: Text(
                  //                                 dues,
                  //                                 style: PayNestTheme
                  //                                     .small_2_12white,
                  //                               )),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   Container(
                  //                     width: 1.sw,
                  //                     height: 1.h,
                  //                     color: PayNestTheme.borderGrey,
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                         vertical: 8.0.h),
                  //                     child: Row(
                  //                       mainAxisAlignment:
                  //                       MainAxisAlignment.center,
                  //                       crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                       children: [
                  //                         Text(
                  //                           view,
                  //                           style: PayNestTheme
                  //                               .h2_14blueAccent,
                  //                         ),
                  //                         SizedBox(
                  //                           width: 5.w,
                  //                         ),
                  //                         SvgPicture.asset(arrowNext),
                  //                       ],
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //             : SizedBox(),
                  //
                  //         SizedBox(
                  //           width: 14.w,
                  //         ),
                  //
                  //         SizedBox(
                  //           height: 230.h,
                  //           width: 156.w,
                  //           child: OutlinedButton(
                  //             style: OutlinedButton.styleFrom(
                  //               // backgroundColor:Colors.blue,
                  //               elevation: 0,
                  //               side: BorderSide(
                  //                   width: 1,
                  //                   color: PayNestTheme.borderGrey),
                  //               shape: RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(
                  //                       12)),
                  //             ),
                  //             onPressed: () {
                  //               Navigator.of(context).push(
                  //                   MaterialPageRoute(
                  //                       builder: (context) =>
                  //                           SelectSchool()));
                  //             },
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Container(
                  //                   height: 32.h,
                  //                   width: 32.w,
                  //                   decoration: BoxDecoration(
                  //                       color: PayNestTheme.blueAccent,
                  //                       borderRadius:
                  //                       BorderRadius.circular(8.r)),
                  //                   child: IconButton(
                  //                     onPressed: () {
                  //                       Navigator.of(context).push(
                  //                           MaterialPageRoute(
                  //                               builder: (context) =>
                  //                                   SelectSchool()));
                  //                     },
                  //                     icon: Icon(
                  //                       Icons.add,
                  //                       color: Colors.white,
                  //                       size: 14.sp,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   height: 15.h,
                  //                 ),
                  //                 Text(
                  //                   addStudent,
                  //                   style: PayNestTheme.h2_14blueAccent,
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     )),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    )
        // Column(
        //   children: [
        //     Container(
        //       height: 129.h,
        //       decoration: BoxDecoration(
        //           color: PayNestTheme.primaryColor,
        //           borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r))
        //       ),
        //       child: SafeArea(
        //         child: Padding(
        //           padding: EdgeInsets.only(left: 25.h),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(welcome,style: PayNestTheme.title20white,),
        //                   Text(lc.userResData.value.parent!.firstName,style: PayNestTheme.subtitle16white,),
        //                 ],
        //               ),
        //               Row(
        //                 children: [
        //                   Container(
        //                     height : 44.h,
        //                     width : 44.w,
        //                     decoration: BoxDecoration(
        //                         color: Colors.white,
        //                         borderRadius: BorderRadius.circular(12)
        //                     ),
        //                     child: IconButton(
        //                         onPressed: (){
        //                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationPage()));
        //                         },
        //                         icon: Image.asset(ic_bell,height: 20.sp,)
        //                       // child: Text(""),
        //                     ),
        //                   ),
        //                   SizedBox(width: 12.w,),
        //                   Container(
        //                     height : 44.h,
        //                     width : 44.w,
        //                     decoration: BoxDecoration(
        //                         color: Colors.white,
        //                         borderRadius: BorderRadius.horizontal(left: Radius.circular(12.r))
        //                     ),
        //                     child: IconButton(
        //                       onPressed: (){
        //                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetAssistance()));
        //
        //                       },
        //                       icon: SvgPicture.asset(faq,semanticsLabel: paynest,height: 20.sp),
        //                     ),
        //                   ),
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     //header end
        //
        //     CarouselSliderPage(),
        //     Expanded(
        //       child: SingleChildScrollView(
        //         physics: BouncingScrollPhysics(),
        //         child: Padding(
        //           padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 23.3.h,bottom: 10.h),
        //           child: Column(
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(pendingTask,style: PayNestTheme.title_2_16primaryColor,),
        //                   GestureDetector(
        //                       onTap: (){
        //                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => PendingTask()));
        //                       },
        //                       child: Text(showAll,style: PayNestTheme.h2_12blueAccent,)),
        //                 ],
        //               ),
        //               SizedBox(height: 10.5.h),
        //
        //               lc.userResData.value.parent!.pin.isEmpty ? SizedBox(
        //                 height: 48.h,
        //                 width: 326.w,
        //                 child: OutlinedButton(
        //                   onPressed: (){
        //                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePIN()));
        //                   },
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text(setPIN,style: PayNestTheme.title_3_16black,),
        //                       SvgPicture.asset(arrowNext,height: 20.sp,)
        //                     ],
        //                   ),
        //                 ),
        //               ):SizedBox(),
        //               SizedBox(height: 10.5.h),
        //
        //               lc.userResData.value.parent!.paymentConfigured == null || lc.userResData.value.parent!.paymentConfigured == false ?SizedBox(
        //                 height: 48.h,
        //                 width: 326.w,
        //                 child: OutlinedButton(
        //                   onPressed: (){},
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text(makeFirstPayment,style: PayNestTheme.title_3_16black,),
        //                       SvgPicture.asset(arrowNext,height: 20.sp,)
        //                     ],
        //                   ),
        //                 ),
        //               ):SizedBox(),
        //               Padding(
        //                 padding: EdgeInsets.only(top: 18.5.h,bottom: 11.h),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     Text(student,style: PayNestTheme.title_2_16primaryColor,),
        //                     Text(showAll,style: PayNestTheme.h2_12blueAccent,),
        //                   ],
        //                 ),
        //               ),
        //               Row(
        //                 children: [
        //                   //if some got some students
        //                   InkWell(
        //
        //                     child: Container(
        //                       height: 210.h,
        //                       width: 156.w,
        //                       decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(12),
        //                           border: Border.all(color: PayNestTheme.borderGrey,width: 1)
        //                       ),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Padding(
        //                             padding: EdgeInsets.symmetric(vertical: 11.h,horizontal: 10.w),
        //                             child: Column(
        //                               mainAxisAlignment: MainAxisAlignment.start,
        //                               crossAxisAlignment: CrossAxisAlignment.start,
        //                               children: [
        //                                 SvgPicture.asset(ic_studentAvatar,height: 50.sp),
        //                                 Padding(
        //                                   padding: EdgeInsets.only(top: 8.21.h,bottom: 8.h),
        //                                   child: Text("Ali Hamdan",style: PayNestTheme.small_14black,),
        //                                 ),
        //                                 Text("Beaconhouse Al Khaleej International Pvt school",style: PayNestTheme.small_2_12textGrey,),
        //                                 SizedBox(height: 15.h,),
        //                                 Container(
        //                                   height: 18.h,
        //                                   width: 50.79.w,
        //                                   decoration: BoxDecoration(
        //                                     color: PayNestTheme.paidGreen,
        //                                     borderRadius: BorderRadius.circular(5),
        //                                   ),
        //                                   child: Center(child: Text(paid,style: PayNestTheme.small_2_12white,)),
        //                                 ),
        //
        //                               ],
        //                             ),
        //                           ),
        //                           Container(
        //                             width: 1.sw,
        //                             height: 1.h,
        //                             color: PayNestTheme.borderGrey,
        //                           ),
        //                           Row(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             crossAxisAlignment: CrossAxisAlignment.center,
        //                             children: [
        //                               Text(view,style: PayNestTheme.h2_14blueAccent,),
        //                               SizedBox(width: 5.w,),
        //                               SvgPicture.asset(arrowNext),
        //                             ],
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //
        //                   SizedBox(width: 14.w,),
        //
        //                   SizedBox(
        //                     height: 210.h,
        //                     width: 156.w,
        //                     child: OutlinedButton(
        //                       style: OutlinedButton.styleFrom(
        //                         // backgroundColor:Colors.blue,
        //                         elevation: 0,
        //                         side: BorderSide(width:1, color:PayNestTheme.borderGrey),
        //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        //                       ),
        //                       onPressed: (){
        //                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectSchool()));
        //
        //                       },
        //                       child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: [
        //                           Container(
        //                             height: 32.h,
        //                             width: 32.w,
        //                             decoration: BoxDecoration(
        //                                 color: Colors.blue,
        //                                 borderRadius: BorderRadius.circular(8.r)
        //                             ),
        //                             child: IconButton(
        //                               onPressed: (){
        //                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectSchool()));
        //
        //                               },
        //                               icon: Icon(Icons.add,color: Colors.white,size: 12.sp,),
        //                             ),
        //                           ),
        //                           SizedBox(height: 15.h,),
        //                           Text(addStudent,style: PayNestTheme.h2_14blueAccent,),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: 15.h,),
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
