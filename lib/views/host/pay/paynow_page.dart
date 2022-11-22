import 'dart:math';

import 'package:encrypt/encrypt.dart' as encryption;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/createtransaction_resp_controller.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/controller/paynow_controller.dart';
import 'package:paynest_flutter_app/controller/updatebank_response_controller.dart';
import 'package:paynest_flutter_app/extension/stack_extension.dart';
import 'package:paynest_flutter_app/model/datamodel/paynowtransaction_detail_model.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart';
import 'package:paynest_flutter_app/model/studentlist_res_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/invoicepayment/invoice_payment_page.dart';
import 'package:paynest_flutter_app/views/host/transactiondetails/paynowltransactiondetails_page.dart';
import 'package:paynest_flutter_app/views/webview/webview.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../constants/constants.dart';
import '../../../model/mystudents_resp_model.dart';
import '../../../res/assets.dart';
import '../../../res/res.dart';
import '../../../widgets/amount_formater.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/inkwell_widget.dart';
import '../../../widgets/toast.dart';

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
  late StudentElement studentElement;

  int idx = 0;
  TextEditingController amountController = TextEditingController();
  TextEditingController parentIDController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController schoolIDController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String payAbleAmount = '0';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    studentController.hitMyStudents(null);
    studentElement = StudentElement.empty();
    studentController.resetStudentCard();
    if (studentController.myStudentData.value.status &&
        studentController.myStudentData.value.students != null &&
        studentController.myStudentData.value.students!.isNotEmpty) {
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
    isLoading = false;
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    studentController.studentData.value.getStudent?.rows?.forEach((student) {
      if (student.firstName!.toUpperCase().contains(text.toUpperCase()) ||
          student.lastName!.toUpperCase().contains(text.toUpperCase())) {
        _searchResult.add(student);
      }
    });

    setState(() {});
  }

  List<StudentListRowData> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              horizontalValue(14),
            ),
            topRight: Radius.circular(
              horizontalValue(14),
            ),
          ),
          color: Colors.white,
        ),
        child: Stack().fullScreenLoader(
          state: isLoading,
          loadingWidget: fullScreenLoader(),
          child: getBody(),
        ),
      ),
    );
  }

  Widget getBody() {
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
                            style: PayNestTheme.title20white.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'montserratBold',
                              fontSize: sizes.fontRatio * 18,
                            ),
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
                  child: studentController.myStudentData.value.status == true
                      ? studentController.myStudentData.value.students !=
                                  null &&
                              studentController
                                  .myStudentData.value.students!.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpacer(16),
                                Text(
                                  selectStudent,
                                  style: PayNestTheme.title_2_16primaryColor
                                      .copyWith(
                                    fontFamily: 'montserratExtraBold',
                                    fontSize: sizes.fontRatio * 16,
                                  ),
                                ),
                                verticalSpacer(13),
                                Container(
                                  decoration: BoxDecoration(
                                    color: PayNestTheme.colorWhite,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: PayNestTheme.primaryColor,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: PayNestTheme.dropShadow
                                            .withOpacity(.3),
                                        spreadRadius: 0,
                                        blurRadius: 10,
                                        offset: Offset(
                                          0,
                                          5,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: horizontalValue(16),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: PayNestTheme.primaryColor,
                                      ),
                                      horizontalSpacer(12),
                                      Expanded(
                                        child: TextFormField(
                                          onTap: () {
                                            onSearchTextChanged('');
                                          },
                                          controller: searchController,
                                          onChanged: onSearchTextChanged,
                                          style: PayNestTheme
                                              .title_2_16primaryColor
                                              .copyWith(
                                            fontSize: sizes.fontRatio * 14,
                                            color: PayNestTheme.black,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: searchStudent,
                                            labelStyle: PayNestTheme
                                                .h2_12blueAccent
                                                .copyWith(
                                              fontSize: sizes.fontRatio * 12,
                                              color: PayNestTheme.lightBlack
                                                  .withOpacity(0.5),
                                              fontFamily: 'montserratRegular',
                                            ),
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                _searchResult.isNotEmpty ||
                                        searchController.text.isNotEmpty
                                    ? Expanded(
                                        child: ListView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          children: [
                                            Container(
                                              height: sizes.heightRatio * 156,
                                              child: ListView.separated(
                                                itemCount: _searchResult.length,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return _singleCard(
                                                    studentController
                                                        .myStudentData
                                                        .value
                                                        .students![index],
                                                    (StudentElement student) {
                                                      payAbleAmount = student
                                                          .student!
                                                          .totalBalanceAmount
                                                          .toString();
                                                      studentController
                                                          .updateSelectedCard(
                                                        student.id,
                                                      );
                                                      studentElement = student;
                                                      amountController.text =
                                                          student.student!
                                                              .totalBalanceAmount
                                                              .toString();
                                                      setState(() {});
                                                    },
                                                    index,
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return horizontalSpacer(16);
                                                },
                                              ),
                                            ),
                                            verticalSpacer(30),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Current Payable Amount',
                                                    style: PayNestTheme
                                                        .h2_12blueAccentLight
                                                        .copyWith(
                                                      fontSize:
                                                          sizes.fontRatio * 14,
                                                      color: PayNestTheme
                                                          .primaryColor,
                                                      fontFamily:
                                                          'montserratSemiBold',
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    '${payAbleAmount != '0' ? amountFormater(
                                                        double.parse(
                                                            payAbleAmount),
                                                      ) : ''}',
                                                    style: PayNestTheme
                                                        .h2_12blueAccent
                                                        .copyWith(
                                                      fontSize:
                                                          sizes.fontRatio * 16,
                                                      color: PayNestTheme
                                                          .primaryColor,
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
                                              color: PayNestTheme.textGrey
                                                  .withOpacity(0.5),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              child: Lottie.asset(
                                                singleStudentJson,
                                                repeat: true,
                                                height: payAbleAmount == '0'
                                                    ? sizes.heightRatio * 327
                                                    : sizes.heightRatio * 114,
                                                width: payAbleAmount == '0'
                                                    ? sizes.widthRatio * 327
                                                    : sizes.widthRatio * 114,
                                              ),
                                            ),
                                            verticalSpacer(16),
                                            payAbleAmount != '0'
                                                ? InkWellWidget(
                                                    onTap: () {
                                                      onPress();
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            horizontalValue(4),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical:
                                                            verticalValue(4),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: PayNestTheme
                                                            .colorWhite,
                                                        border: Border.all(
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 0.5,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(1, 3),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          horizontalSpacer(16),
                                                          _commercial_image(
                                                            imagePath:
                                                                icCommercialBank,
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                payBy,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: PayNestTheme
                                                                    .title_2_16primaryColor
                                                                    .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      sizes.fontRatio *
                                                                          14,
                                                                  color: PayNestTheme
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          horizontalSpacer(16),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            verticalSpacer(8),
                                            payAbleAmount != '0'
                                                ? Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 2,
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                      horizontalSpacer(10),
                                                      Text(
                                                        'OR',
                                                        style: PayNestTheme
                                                            .h2_12blueAccent
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              sizes.fontRatio *
                                                                  14,
                                                          color: PayNestTheme
                                                              .black,
                                                        ),
                                                      ),
                                                      horizontalSpacer(10),
                                                      Expanded(
                                                        child: Container(
                                                          height: 2,
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox.shrink(),
                                            verticalSpacer(8),
                                            payAbleAmount != '0'
                                                ? InkWellWidget(
                                                    onTap: () {
                                                      showToast(
                                                          context: context,
                                                          messege:
                                                              'Coming Soon!',
                                                          color: PayNestTheme
                                                              .primaryColor);
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            horizontalValue(4),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical:
                                                            verticalValue(12),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: PayNestTheme
                                                            .colorWhite,
                                                        border: Border.all(
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 0.5,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(1, 3),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          horizontalSpacer(32),
                                                          _otherImage(
                                                            imagePath: icLean,
                                                          ),
                                                          horizontalSpacer(16),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                payByBankTransfer,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: PayNestTheme
                                                                    .title_2_16primaryColor
                                                                    .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      sizes.fontRatio *
                                                                          14,
                                                                  color: PayNestTheme
                                                                      .primaryColor
                                                                      .withOpacity(
                                                                          0.5),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          horizontalSpacer(16),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            verticalSpacer(8),
                                            payAbleAmount != '0'
                                                ? InkWellWidget(
                                                    onTap: () {
                                                      showToast(
                                                          messege:
                                                              'Coming Soon!',
                                                          context: context,
                                                          color: PayNestTheme
                                                              .primaryColor);
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            horizontalValue(4),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical:
                                                            verticalValue(12),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: PayNestTheme
                                                            .colorWhite,
                                                        border: Border.all(
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 0.5,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(1, 3),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          horizontalSpacer(32),
                                                          _otherImage(
                                                            imagePath:
                                                                icPostPay,
                                                          ),
                                                          horizontalSpacer(16),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                payByInstallments,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: PayNestTheme
                                                                    .title_2_16primaryColor
                                                                    .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      sizes.fontRatio *
                                                                          14,
                                                                  color: PayNestTheme
                                                                      .primaryColor
                                                                      .withOpacity(
                                                                          0.5),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          horizontalSpacer(16),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            verticalSpacer(16),
                                          ],
                                        ),
                                      )
                                    : Expanded(
                                        child: ListView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          children: [
                                            Container(
                                              height: sizes.heightRatio * 156,
                                              child: ListView.separated(
                                                itemCount: studentController
                                                    .myStudentData
                                                    .value
                                                    .students!
                                                    .length,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return _singleCard(
                                                    studentController
                                                        .myStudentData
                                                        .value
                                                        .students![index],
                                                    (StudentElement student) {
                                                      payAbleAmount = student
                                                          .student!
                                                          .totalBalanceAmount
                                                          .toString();
                                                      studentController
                                                          .updateSelectedCard(
                                                        student.id,
                                                      );
                                                      studentElement = student;
                                                      amountController.text =
                                                          student.student!
                                                              .totalBalanceAmount
                                                              .toString();
                                                      setState(() {});
                                                    },
                                                    index,
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return horizontalSpacer(16);
                                                },
                                              ),
                                            ),
                                            verticalSpacer(30),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Current Payable Amount',
                                                    style: PayNestTheme
                                                        .h2_12blueAccentLight
                                                        .copyWith(
                                                      fontSize:
                                                          sizes.fontRatio * 14,
                                                      color: PayNestTheme
                                                          .primaryColor,
                                                      fontFamily:
                                                          'montserratSemiBold',
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    '${payAbleAmount != '0' ? amountFormater(
                                                        double.parse(
                                                            payAbleAmount),
                                                      ) : ''}',
                                                    style: PayNestTheme
                                                        .h2_12blueAccent
                                                        .copyWith(
                                                      fontSize:
                                                          sizes.fontRatio * 16,
                                                      color: PayNestTheme
                                                          .primaryColor,
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
                                              color: PayNestTheme.textGrey
                                                  .withOpacity(0.5),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              child: Lottie.asset(
                                                singleStudentJson,
                                                repeat: true,
                                                height: payAbleAmount == '0'
                                                    ? sizes.heightRatio * 327
                                                    : sizes.heightRatio * 114,
                                                width: payAbleAmount == '0'
                                                    ? sizes.widthRatio * 327
                                                    : sizes.widthRatio * 114,
                                              ),
                                            ),
                                            verticalSpacer(16),
                                            payAbleAmount != '0'
                                                ? InkWellWidget(
                                                    onTap: () {
                                                      onPress();
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            horizontalValue(4),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical:
                                                            verticalValue(4),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: PayNestTheme
                                                            .colorWhite,
                                                        border: Border.all(
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 0.5,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(1, 3),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          horizontalSpacer(16),
                                                          _commercial_image(
                                                            imagePath:
                                                                icCommercialBank,
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                payBy,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: PayNestTheme
                                                                    .title_2_16primaryColor
                                                                    .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      sizes.fontRatio *
                                                                          14,
                                                                  color: PayNestTheme
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          horizontalSpacer(16),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            verticalSpacer(8),
                                            payAbleAmount != '0'
                                                ? Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 2,
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                      horizontalSpacer(10),
                                                      Text(
                                                        'OR',
                                                        style: PayNestTheme
                                                            .h2_12blueAccent
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              sizes.fontRatio *
                                                                  14,
                                                          color: PayNestTheme
                                                              .black,
                                                        ),
                                                      ),
                                                      horizontalSpacer(10),
                                                      Expanded(
                                                        child: Container(
                                                          height: 2,
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox.shrink(),
                                            verticalSpacer(8),
                                            payAbleAmount != '0'
                                                ? InkWellWidget(
                                                    onTap: () {
                                                      showToast(
                                                          context: context,
                                                          messege:
                                                              'Coming Soon!',
                                                          color: PayNestTheme
                                                              .primaryColor);
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            horizontalValue(4),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical:
                                                            verticalValue(12),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: PayNestTheme
                                                            .colorWhite,
                                                        border: Border.all(
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 0.5,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(1, 3),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          horizontalSpacer(32),
                                                          _otherImage(
                                                            imagePath: icLean,
                                                          ),
                                                          horizontalSpacer(16),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                payByBankTransfer,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: PayNestTheme
                                                                    .title_2_16primaryColor
                                                                    .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      sizes.fontRatio *
                                                                          14,
                                                                  color: PayNestTheme
                                                                      .primaryColor
                                                                      .withOpacity(
                                                                          0.5),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          horizontalSpacer(16),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            verticalSpacer(8),
                                            payAbleAmount != '0'
                                                ? InkWellWidget(
                                                    onTap: () {
                                                      showToast(
                                                          messege:
                                                              'Coming Soon!',
                                                          context: context,
                                                          color: PayNestTheme
                                                              .primaryColor);
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            horizontalValue(4),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical:
                                                            verticalValue(12),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: PayNestTheme
                                                            .colorWhite,
                                                        border: Border.all(
                                                          color: PayNestTheme
                                                              .primaryColor,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 0.5,
                                                            blurRadius: 5,
                                                            offset:
                                                                Offset(1, 3),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          horizontalSpacer(32),
                                                          _otherImage(
                                                            imagePath:
                                                                icPostPay,
                                                          ),
                                                          horizontalSpacer(16),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                payByInstallments,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: PayNestTheme
                                                                    .title_2_16primaryColor
                                                                    .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      sizes.fontRatio *
                                                                          14,
                                                                  color: PayNestTheme
                                                                      .primaryColor
                                                                      .withOpacity(
                                                                          0.5),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          horizontalSpacer(16),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            verticalSpacer(16),
                                          ],
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
                                  style:
                                      PayNestTheme.title_3_16blackbold.copyWith(
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
                                  style:
                                      PayNestTheme.title_3_16blackbold.copyWith(
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
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPress() async {
    if (studentController.myStudentData.value.status &&
        int.parse(amountController.text) > 0) {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => MyWebView(
            title: "CBD",
            amount: amountController.text,
            indx: idx,
            orderId: Random().nextInt(
              1000000000,
            ),
            schoolId: int.parse(
              schoolIDController.text,
            ),
          ),
        ),
      );
      isLoading = true;
      setState(() {});
      if (result != null && result['ResponseMsg'] == 'success') {
        var amount = payAbleAmount;
        bool status = await ctrcController.hitCreateTransaction(
          schoolIDController.text,
          parentIDController.text,
          studentIDController.text,
          amountController.text,
          result,
        );
        if (status) {
          studentController.myStudentData.update(
            (val) {
              String? schoolName;
              for (int i = 0; i < val!.students!.length; i++) {
                if (val.students![i].student!.totalBalanceAmount ==
                    payAbleAmount) {
                  schoolName = val.students![i].student!.school?.name ?? '';
                  break;
                }
              }
              PayNowTransactionDetailModel model;
              model = _getModel(
                studentElement,
                schoolName,
                amount,
              );
              isLoading = false;
              setState(() {});
              Future.delayed(
                Duration(
                  seconds: 1,
                ),
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PayNowTransactionDetailsPage(
                        pntdm: model,
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else {
          isLoading = false;
          setState(() {});
          Future.delayed(
            Duration(seconds: 1),
            () {
              showToast(
                  context: context,
                  messege: 'Something went wrong with the transaction',
                  color: PayNestTheme.red);
            },
          );
        }
      } else if (result == null) {
        isLoading = false;
        setState(() {});
        Future.delayed(
          Duration(seconds: 1),
          () {
            showToast(
              context: context,
              messege: 'Something went wrong',
              color: PayNestTheme.red,
            );
          },
        );
      }
    } else if (int.parse(payAbleAmount) < 0) {
      isLoading = false;
      showToast(
          context: context,
          messege: 'Amount is not correct',
          color: PayNestTheme.red);
    } else if (int.parse(payAbleAmount) == 0) {
      isLoading = false;
      showToast(
          context: context,
          messege: 'Fees already paid',
          color: PayNestTheme.paidGreen);
    }
  }

  Widget _commercial_image({required String imagePath}) {
    return Container(
      height: sizes.heightRatio * 41,
      width: sizes.widthRatio * 41,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _otherImage({required String imagePath}) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        height: sizes.heightRatio * 26,
        width: sizes.widthRatio * 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
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

  Widget _singleCard(StudentElement studentElement, Function onTap, int index) {
    return InkWellWidget(
      onTap: () => onTap(studentElement),
      child: Opacity(
        opacity: studentElement.isSelected ? 1 : 0.5,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8,
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
                  Container(
                    height: sizes.heightRatio * 50,
                    width: sizes.widthRatio * 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      studentElement.student?.gender == "male"
                          ? icMale
                          : icFemale,
                    ),
                  ),
                  verticalSpacer(8),
                  Container(
                    width: sizes.widthRatio * 60,
                    child: Text(
                      '${studentElement.student?.firstName} \n  ${(studentElement.student?.lastName != '-' ? studentElement.student?.lastName : '')}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                        fontSize: sizes.fontRatio * 13,
                        color: index % 2 == 0
                            ? PayNestTheme.colorWhite
                            : PayNestTheme.black,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: sizes.widthRatio * 80,
                    child: Text(
                      '${studentElement.student?.school!.name}',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: PayNestTheme.small_2_10textGrey.copyWith(
                        fontSize: sizes.fontRatio * 10,
                        color: index % 2 == 0
                            ? PayNestTheme.colorWhite
                            : PayNestTheme.black,
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
              child: SvgPicture.asset(
                icAdd,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PayNowTransactionDetailModel _getModel(
    StudentElement studentElement,
    String? schoolName,
    String amount,
  ) {
    return PayNowTransactionDetailModel(
      schoolName: schoolName,
      student: PayNowTransactionDetailStudent(
        id: studentElement.id,
        studentRegNo: studentElement.student!.studentRegNo,
        firstName: studentElement.student!.firstName,
        lastName: studentElement.student!.lastName,
        grade: studentElement.student!.grade,
        parentEmiratesId: studentElement.student!.parentEmiratesId,
        parentPhoneNumber: studentElement.student!.parentPhoneNumber,
        dob: studentElement.student!.dob,
        admissionDate: studentElement.student!.admissionDate,
        deletedAt: studentElement.student!.deletedAt,
        schoolId: studentElement.student!.schoolId,
        totalBalanceAmount:
            studentElement.student!.totalBalanceAmount.toString(),
        guardianFirstName: studentElement.student!.guardianFirstName!,
        guardianLastName: studentElement.student!.guardianLastName!,
        guardianGender: studentElement.student!.guardianGender!,
        guardianEmiratesId: studentElement.student!.guardianEmiratesId!,
        guardianNationality: studentElement.student!.guardianNationality!,
        guardianReligion: studentElement.student!.guardianReligion!,
        area: studentElement.student!.area!,
        region: studentElement.student!.region!,
        streetAddress: studentElement.student!.streetAddress!,
        email: studentElement.student!.email!,
        phoneNumber: studentElement.student!.phoneNumber!,
        otherNumber: studentElement.student!.otherNumber!,
        profile: studentElement.student!.profile,
        religion: studentElement.student!.religion!,
        nationality: studentElement.student!.nationality!,
        gender: studentElement.student!.gender!,
        dueDate: studentElement.student!.dueDate!,
        file: studentElement.student!.file,
        privacy: studentElement.student!.privacy!,
        createdAt: studentElement.student!.createdAt!,
        updatedAt: studentElement.student!.updatedAt!,
      ),
      referenceNo: '',
      paidOn: DateTime.now(),
      amountPaid: amount,
    );
  }
}
