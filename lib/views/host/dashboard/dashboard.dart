import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/assistance/get_assistance.dart';
import 'package:paynest_flutter_app/views/host/changepin/change_pin.dart';
import 'package:paynest_flutter_app/views/host/dashboard/widgets/add_student_bottom_sheet.dart';
import 'package:paynest_flutter_app/views/host/dashboard/widgets/recent_transaction.dart';
import 'package:paynest_flutter_app/views/host/dashboard/widgets/student_card.dart';
import 'package:paynest_flutter_app/views/host/notification/notification_page.dart';
import 'package:paynest_flutter_app/views/host/pay/paynow_page.dart';
import 'package:paynest_flutter_app/views/host/pendingtask/pending_task.dart';
import 'package:paynest_flutter_app/views/host/singlestudent/singlestudent_page.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../controller/transactionlist_controller.dart';
import '../../../model/mystudents_resp_model.dart' as studentElement;

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final UserController lc = Get.put(UserController());
  final MyStudentController myStudentController =
      Get.put(MyStudentController());
  final TransactionListController transactionListController =
      Get.put(TransactionListController());
  final UserController userController = Get.find<UserController>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStudents();
    fetchTransactions();
  }

  fetchStudents() async {
    await myStudentController.hitMyStudents(
      lc.userResData.value.parent!.id,
    );
  }

  fetchTransactions() async {
    await transactionListController.hitTransaction(
      userController.userResData.value.parent!.id.toString(),
    );
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: PayNestTheme.colorWhite,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      String fullName = lc.userResData.value.parent!.firstName.toString() +
          ' ' +
          lc.userResData.value.parent!.lastName.toString();
      return Scaffold(
        body: Column(
          children: [
            Container(
              height: sizes.heightRatio * 150,
              decoration: BoxDecoration(
                color: PayNestTheme.primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                    24.r,
                  ),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacer(24),
                      Image.asset(
                        welcomeRegisterLogo,
                        width: sizes.widthRatio * 70,
                        color: PayNestTheme.colorWhite,
                      ),
                      verticalSpacer(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back",
                                style: PayNestTheme.small_2_12black.copyWith(
                                  fontSize: sizes.fontRatio * 14,
                                  fontFamily: 'montserratRegular',
                                  color: PayNestTheme.colorWhite,
                                ),
                              ),
                              Text(
                                fullName,
                                style: PayNestTheme.subtitle16white.copyWith(
                                  fontSize: sizes.fontRatio * 22,
                                  fontFamily: 'montserratSemiBold',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 44.h,
                                width: 44.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NotificationPage(),
                                      ),
                                    );
                                  },
                                  icon: Lottie.asset(
                                    notificationAnimation,
                                    repeat: true,
                                  ),
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
                                    left: Radius.circular(12.r),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => GetAssistance(),
                                      ),
                                    );
                                  },
                                  icon: Lottie.asset(
                                    supportAnimation,
                                    repeat: true,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            verticalSpacer(12),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
              ),
              child: Row(
                children: [
                  Text(
                    'Students',
                    style: PayNestTheme.title20white.copyWith(
                      fontSize: sizes.fontRatio * 16,
                      color: PayNestTheme.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Show All',
                    style: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio * 12,
                      color: PayNestTheme.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(8),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    bottom: 10.h,
                  ),
                  child: Column(
                    children: [
                      Obx(
                        () => myStudentController
                                    .myStudentData.value.students !=
                                null
                            ? StudentCard(
                                students: myStudentController
                                    .myStudentData.value.students!,
                                onTap: (student) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SingleStudentPage(
                                        singleStudentModel: getStudentModel(
                                          studentElement: student,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const SizedBox.shrink(),
                      ),
                      verticalSpacer(16),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PayNestTheme.primaryColor,
                            elevation: 0,
                            // side: BorderSide(width:1, color:Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: verticalValue(12),
                            ),
                          ),
                          onPressed: () {
                            AddStudentBottomSheet.show(
                              context: context,
                            );
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: sizes.heightRatio * 30,
                                  width: sizes.heightRatio * 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: PayNestTheme.colorWhite,
                                        width: 2.5),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: PayNestTheme.colorWhite,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                horizontalSpacer(10),
                                Text(
                                  addStudent,
                                  style: PayNestTheme.title_2_16primaryColor
                                      .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: PayNestTheme.colorWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      verticalSpacer(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pendingTask,
                            style: PayNestTheme.h2_12blueAccent.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PendingTask(),
                                ),
                              );
                            },
                            child: Text(
                              showAll,
                              style: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: PayNestTheme.textGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpacer(10),
                      Obx(
                        () => lc.userResData.value.parent!.pin == null
                            ? SizedBox(
                                height: 48.h,
                                width: 326.w,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ChangePIN(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                            : SizedBox.shrink(),
                      ),
                      verticalSpacer(10),
                      Obx(
                        () => lc.userResData.value.parent!.paymentConfigured ==
                                    null ||
                                lc.userResData.value.parent!.paymentConfigured
                                    .toString()
                                    .isEmpty
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PayNowPage(
                                        whichStack: "other",
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: horizontalValue(12),
                                    vertical: verticalValue(12),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      18,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(
                                          0,
                                          1,
                                        ),
                                      ),
                                    ],
                                    color: PayNestTheme.colorDimPrimary,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        makeFirstPayment,
                                        style: PayNestTheme.small_2_12black
                                            .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: sizes.fontRatio * 13,
                                          color: PayNestTheme.black,
                                        ),
                                      ),
                                      Lottie.asset(
                                        arrowForwardAnimation,
                                        repeat: true,
                                        width: sizes.widthRatio * 22,
                                        height: sizes.heightRatio * 22,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                      SizedBox(height: 10.5.h),
                      Padding(
                        padding: EdgeInsets.only(top: 18.5.h, bottom: 11.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              recentTransactions,
                              style: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: PayNestTheme.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => StudentPage(
                                //       whichStack: "other",
                                //     ),
                                //   ),
                                // );
                              },
                              child: Text(
                                showAll,
                                style: PayNestTheme.h2_12blueAccent.copyWith(
                                  fontSize: sizes.fontRatio * 12,
                                  color: PayNestTheme.textGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(8),
                      transactionListController
                                  .transactionListData.value.transactions !=
                              null
                          ? RecentTransactions(
                              transactions: transactionListController
                                  .transactionListData.value.transactions!,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
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
