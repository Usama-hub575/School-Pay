import 'dart:math';

import 'package:encrypt/encrypt.dart' as encryption;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/createtransaction_resp_controller.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/controller/paynow_controller.dart';
import 'package:paynest_flutter_app/controller/updatebank_response_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/paynowtransaction_detail_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/transactiondetails/paynowltransactiondetails_page.dart';
import 'package:paynest_flutter_app/views/webview/webview.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../model/mystudents_resp_model.dart';
import '../../../res/res.dart';

class PayNowPage extends StatefulWidget {
  final String whichStack;

  const PayNowPage({required this.whichStack});

  @override
  State<PayNowPage> createState() => _PayNowPageState();
}

class _PayNowPageState extends State<PayNowPage> {
  final MyStudentController studentController = Get.find<MyStudentController>();
  final PayNowController payNowController = Get.put(PayNowController());
  final CreateTransactionRespController ctrcController =
      Get.put(CreateTransactionRespController());
  final SetBankResponseController sbrController =
      Get.put(SetBankResponseController());

  int idx = 0;
  TextEditingController amountController = TextEditingController();
  TextEditingController parentIDController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController schoolIDController = TextEditingController();
  String payAbleAmount = '0';

  @override
  void initState() {
    super.initState();
    if (studentController.myStudentData.value.status) {
      amountController.text = studentController
          .myStudentData.value.students![0].student!.totalBalanceAmount
          .toString();
      studentIDController.text = studentController
          .myStudentData.value.students![0].studentId
          .toString();
      parentIDController.text = studentController
          .myStudentData.value.students![0].parentId
          .toString();
      schoolIDController.text = studentController
          .myStudentData.value.students![0].student!.schoolId
          .toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: PayNestTheme.primaryColor,
        body: Column(
          children: [
            Container(
              height: 129.h,
              width: MediaQuery.of(context).size.width,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          widget.whichStack == "other"
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    right: 25.h,
                                  ),
                                  child: Container(
                                    height: 44.h,
                                    width: 44.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
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
                                        color: PayNestTheme.blueAccent,
                                      ),
                                      // child: Text(""),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          Spacer(),
                          Text(
                            pay,
                            style: PayNestTheme.title20white,
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: PayNestTheme.colorWhite,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      26.r,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: studentController.myStudentData.value.status
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpacer(16),
                            Text(
                              selectStudent,
                              style: PayNestTheme.title_2_16primaryColor,
                            ),
                            Container(
                              height: sizes.heightRatio * 156,
                              child: ListView.separated(
                                itemCount: studentController
                                    .myStudentData.value.students!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  // return Padding(
                                  //   padding:
                                  //       EdgeInsets.symmetric(horizontal: 8.w),
                                  //   child: SizedBox(
                                  //     // height: 84.h,
                                  //     width: 100.w,
                                  //     child: OutlinedButton(
                                  //       style: OutlinedButton.styleFrom(
                                  //         elevation: 0,
                                  //         side: BorderSide(
                                  //           width: 1,
                                  //           color: idx == index
                                  //               ? PayNestTheme.blueAccent
                                  //               : PayNestTheme.borderGrey,
                                  //         ),
                                  //         shape: RoundedRectangleBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(12),
                                  //         ),
                                  //       ),
                                  //       onPressed: () {
                                  //         setState(
                                  //           () {
                                  //             idx = index;
                                  //             amountController.text =
                                  //                 studentController
                                  //                     .myStudentData
                                  //                     .value
                                  //                     .students![index]
                                  //                     .student!
                                  //                     .totalBalanceAmount
                                  //                     .toString();
                                  //             studentIDController.text =
                                  //                 studentController
                                  //                     .myStudentData
                                  //                     .value
                                  //                     .students![index]
                                  //                     .studentId
                                  //                     .toString();
                                  //             parentIDController.text =
                                  //                 studentController
                                  //                     .myStudentData
                                  //                     .value
                                  //                     .students![index]
                                  //                     .parentId
                                  //                     .toString();
                                  //             schoolIDController.text =
                                  //                 studentController
                                  //                     .myStudentData
                                  //                     .value
                                  //                     .students![index]
                                  //                     .student!
                                  //                     .schoolId
                                  //                     .toString();
                                  //           },
                                  //         );
                                  //       },
                                  //       child: Column(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.center,
                                  //         children: [
                                  //           CircleAvatar(
                                  //             radius: 18.r,
                                  //           ),
                                  //           SizedBox(
                                  //             height: 15.h,
                                  //           ),
                                  //           Text(
                                  //             studentController
                                  //                     .myStudentData
                                  //                     .value
                                  //                     .students![index]
                                  //                     .student!
                                  //                     .firstName +
                                  //                 " " +
                                  //                 studentController
                                  //                     .myStudentData
                                  //                     .value
                                  //                     .students![index]
                                  //                     .student!
                                  //                     .lastName,
                                  //             style: PayNestTheme
                                  //                 .h2_12blueAccentLight,
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // );
                                  return _singleCard(
                                    studentController
                                        .myStudentData.value.students![index],
                                    (StudentElement student) {
                                      payAbleAmount = "AED " + student.student!.totalBalanceAmount.toString();
                                      studentController.updateSelectedCard(student.id);
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return horizontalSpacer(16);
                                },
                              ),
                            ),
                            verticalSpacer(16),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Current Payable Amount',
                                    style: PayNestTheme.h2_12blueAccentLight
                                        .copyWith(
                                      fontSize: sizes.fontRatio * 12,
                                      color: PayNestTheme.primaryColor,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${payAbleAmount!= 0 ? payAbleAmount : ''}',
                                    style: PayNestTheme.h2_12blueAccent
                                        .copyWith(
                                      fontSize: sizes.fontRatio * 12,
                                      color: PayNestTheme.primaryColor,
                                    ),
                                  ),
                                  horizontalSpacer(16),
                                ],
                              ),
                            ),
                            verticalSpacer(8),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: horizontalValue(16),
                              ),
                              child: Lottie.asset(
                                singleStudentJson,
                                repeat: true,
                                height: sizes.heightRatio * 250,
                              ),
                            ),
                            verticalSpacer(16),
                          ],
                        )
                      : SizedBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> encrypt(amount) async {
    final key = encryption.Key.fromUtf8("90UJEG5OQZYD1OAB");
    final iv = encryption.IV.fromUtf8("90UJEG5OQZYD1OAB");
    final encrypter =
        encryption.Encrypter(encryption.AES(key, mode: encryption.AESMode.cbc));
    final encrypted = encrypter.encrypt(amount, iv: iv);
    print(encrypted.base64);
    return encrypted.base64;
  }

  Widget _singleCard(StudentElement studentElement, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(studentElement),
      child: Opacity(
        opacity: studentElement.isSelected ? 1 : 0.5,
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: verticalValue(10),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(12),
                  vertical: verticalValue(16),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: PayNestTheme.primaryColor.withOpacity(0.5),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn.dribbble.com/users/1973964/screenshots/8807446/admissions_4x.jpg',
                      ),
                      minRadius: 16,
                      maxRadius: 24,
                    ),
                    verticalSpacer(12),
                    Text(
                      '${studentElement.student?.firstName} \n ${studentElement.student?.lastName} ',
                      textAlign: TextAlign.center,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                        fontSize: sizes.fontRatio * 12,
                        color: PayNestTheme.colorWhite,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: sizes.widthRatio * 80,
                      child: Text(
                        '${studentElement.student?.school!.name}',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontSize: sizes.fontRatio * 11,
                          color: PayNestTheme.colorWhite,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: PayNestTheme.primaryColor,
                  radius: 16,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: PayNestTheme.colorWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
