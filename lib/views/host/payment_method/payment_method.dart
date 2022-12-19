import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constants/constants.dart';
import '../../../controller/createtransaction_resp_controller.dart';
import '../../../controller/myStudent_controller.dart';
import '../../../controller/updatebank_response_controller.dart';
import '../../../model/datamodel/paynowtransaction_detail_model.dart';
import '../../../model/datamodel/singlestudent_model.dart';
import '../../../res/res.dart';
import '../../../theme/theme.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/full_screen_loader.dart';
import '../../../widgets/inkwell_widget.dart';
import '../../../widgets/spacer.dart';
import '../../../widgets/toast.dart';
import '../../webview/webview.dart';
import '../transactiondetails/paynowltransactiondetails_page.dart';
import 'package:paynest_flutter_app/extension/stack_extension.dart';

class PaymentMethod extends StatefulWidget {
  final SingleStudentModel singleStudentModel;
  final int payment;

  const PaymentMethod({
    Key? key,
    required this.singleStudentModel,
    required this.payment,
  }) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final MyStudentController studentController = Get.find<MyStudentController>();
  final CreateTransactionRespController ctrcController =
      Get.put(CreateTransactionRespController());
  final SetBankResponseController sbrController =
      Get.put(SetBankResponseController());

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

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
    return Scaffold(
      backgroundColor: PayNestTheme.primaryColor,
      body: Column(
        children: [
          Container(
            height: 129.h,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(16),
            ),
            decoration: BoxDecoration(
              color: PayNestTheme.primaryColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24.r),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  verticalSpacer(16),
                  Row(
                    children: [
                      AppBarBackButton(
                        iconColor: PayNestTheme.primaryColor,
                        buttonColor: PayNestTheme.colorWhite,
                      ),
                      horizontalSpacer(40),
                      Text(
                        paymentsMethod,
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
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: PayNestTheme.colorWhite,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(26.r),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue(24),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(36),
                    Container(
                      child: Text(
                        selectPaymentsMethod,
                        style: PayNestTheme.h2_14blueAccent.copyWith(
                          color: PayNestTheme.primaryColor,
                          fontSize: sizes.fontRatio * 16,
                          fontFamily: 'montserratBold',
                        ),
                      ),
                    ),
                    verticalSpacer(10),
                    Container(
                      child: Text(
                        selectPaymentsMethodSecure,
                        style: PayNestTheme.small_2_10textGrey.copyWith(
                          color: PayNestTheme.lightBlack,
                          fontSize: sizes.fontRatio * 12,
                          fontFamily: 'montserratMedium',
                        ),
                      ),
                    ),
                    verticalSpacer(10),
                    Container(
                      width: sizes.widthRatio * 284,
                      height: sizes.heightRatio * 284,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          icPaymentMethod,
                        ),
                        fit: BoxFit.cover,
                      )),
                    ),
                    InkWellWidget(
                      onTap: () async {
                        await onPaymentPress();
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: horizontalValue(4),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: verticalValue(4),
                        ),
                        decoration: BoxDecoration(
                          color: PayNestTheme.colorWhite,
                          border: Border.all(
                            color: PayNestTheme.primaryColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: Offset(1, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            horizontalSpacer(16),
                            _commercial_image(
                              imagePath: icCommercialBank,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  payBy,
                                  textAlign: TextAlign.center,
                                  style: PayNestTheme.title_2_16primaryColor
                                      .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: sizes.fontRatio * 14,
                                    color: PayNestTheme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpacer(16),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                        horizontalSpacer(10),
                        Text(
                          'OR',
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: sizes.fontRatio * 14,
                            color: PayNestTheme.black,
                          ),
                        ),
                        horizontalSpacer(10),
                        Expanded(
                          child: Container(
                            height: 2,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(8),
                    InkWellWidget(
                      onTap: () {
                        showToast(
                            context: context,
                            messege: 'Coming Soon!',
                            color: PayNestTheme.primaryColor);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: horizontalValue(4),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: verticalValue(12),
                        ),
                        decoration: BoxDecoration(
                          color: PayNestTheme.colorWhite,
                          border: Border.all(
                            color: PayNestTheme.primaryColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: Offset(1, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
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
                                  textAlign: TextAlign.center,
                                  style: PayNestTheme.title_2_16primaryColor
                                      .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: sizes.fontRatio * 14,
                                    color: PayNestTheme.primaryColor
                                        .withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpacer(16),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(8),
                    InkWellWidget(
                      onTap: () {
                        showToast(
                            context: context,
                            messege: 'Coming Soon!',
                            color: PayNestTheme.primaryColor);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: horizontalValue(4),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: verticalValue(12),
                        ),
                        decoration: BoxDecoration(
                          color: PayNestTheme.colorWhite,
                          border: Border.all(
                            color: PayNestTheme.primaryColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: Offset(1, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            horizontalSpacer(32),
                            _otherImage(
                              imagePath: icPostPay,
                            ),
                            horizontalSpacer(16),
                            Expanded(
                              child: Center(
                                child: Text(
                                  payByInstallments,
                                  textAlign: TextAlign.center,
                                  style: PayNestTheme.title_2_16primaryColor
                                      .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: sizes.fontRatio * 14,
                                    color: PayNestTheme.primaryColor
                                        .withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpacer(16),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future onPaymentPress() async {
    if (studentController.myStudentData.value.status) {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => MyWebView(
            title: "CBD",
            amount: widget.payment.toString(),
            indx: 0,
            orderId: Random().nextInt(
              1000000000,
            ),
            schoolId: widget.singleStudentModel.student!.schoolId,
          ),
        ),
      );
      isLoading = true;
      if (mounted) {
        setState(() {});
      }
      if (result != null && result['ResponseMsg'] == 'success') {
        var amount = widget.payment;
        bool status = await ctrcController.hitCreateTransaction(
          widget.singleStudentModel.student!.schoolId.toString(),
          widget.singleStudentModel.parentId.toString(),
          widget.singleStudentModel.student!.id.toString(),
          widget.payment.toString(),
          result,
        );
        if (status) {
          studentController.myStudentData.update(
            (val) {
              String? schoolName;
              for (int i = 0; i < val!.students!.length; i++) {
                if (val.students![i].student!.school!.id ==
                    widget.singleStudentModel.student!.schoolId) {
                  schoolName = val.students![i].student!.school?.name ?? '';
                  break;
                }
              }
              PayNowTransactionDetailModel model;
              model = _getModel(
                widget.singleStudentModel,
                schoolName ?? '',
                amount.toString(),
              );
              isLoading = false;
              if (mounted) {
                setState(() {});
              }
              Future.delayed(
                Duration.zero,
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
          if (mounted) {
            isLoading = false;
            setState(() {});
            Future.delayed(
              Duration.zero,
              () {
                showToast(
                    context: context,
                    messege: 'Something went wrong with the transaction',
                    color: PayNestTheme.red);
              },
            );
          }
        }
      } else if(result == null) {
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
    } else if (widget.payment < 0) {
      isLoading = false;
      setState(() {});
      Future.delayed(
        Duration(seconds: 1),
        () {
          showToast(
              context: context,
              messege: 'Amount is not correct',
              color: PayNestTheme.red);
        },
      );
    } else if (widget.payment == 0) {
      isLoading = false;
      setState(() {});
      Future.delayed(
        Duration(seconds: 1),
        () {
          showToast(
            context: context,
            messege: 'Fees already paid',
            color: PayNestTheme.paidGreen,
          );
        },
      );
    }
  }

  PayNowTransactionDetailModel _getModel(
    SingleStudentModel singleStudentModel,
    String? schoolName,
    String amount,
  ) {
    return PayNowTransactionDetailModel(
      schoolName: schoolName,
      student: PayNowTransactionDetailStudent(
        id: singleStudentModel.student?.id ?? 0,
        studentRegNo: singleStudentModel.student?.studentRegNo ?? '-',
        firstName: singleStudentModel.student?.firstName ?? '-',
        lastName: singleStudentModel.student?.lastName ?? '-',
        grade: singleStudentModel.student?.grade ?? '-',
        parentEmiratesId: singleStudentModel.student?.parentEmiratesId ?? '-',
        parentPhoneNumber: singleStudentModel.student?.parentPhoneNumber ?? '-',
        dob: singleStudentModel.student?.dob ?? DateTime.now(),
        admissionDate:
            singleStudentModel.student?.admissionDate ?? DateTime.now(),
        deletedAt: singleStudentModel.student?.deletedAt ?? '-',
        schoolId: singleStudentModel.student?.schoolId ?? 0,
        totalBalanceAmount:
            singleStudentModel.student?.totalBalanceAmount.toString() ?? '-',
        guardianFirstName: singleStudentModel.student?.guardianFirstName,
        guardianLastName: singleStudentModel.student?.guardianLastName!,
        guardianGender: singleStudentModel.student?.guardianGender!,
        guardianEmiratesId: singleStudentModel.student?.guardianEmiratesId!,
        guardianNationality: singleStudentModel.student?.guardianNationality!,
        guardianReligion: singleStudentModel.student?.guardianReligion!,
        area: singleStudentModel.student?.area,
        region: singleStudentModel.student?.region,
        streetAddress: singleStudentModel.student?.streetAddress,
        email: singleStudentModel.student?.email,
        phoneNumber: singleStudentModel.student?.phoneNumber ?? '-',
        otherNumber: singleStudentModel.student?.otherNumber,
        profile: singleStudentModel.student?.profile,
        religion: singleStudentModel.student?.religion,
        nationality: singleStudentModel.student?.nationality,
        gender: singleStudentModel.student?.gender,
        dueDate: singleStudentModel.student?.dueDate,
        file: singleStudentModel.student?.file,
        privacy: singleStudentModel.student?.privacy ?? '-',
        createdAt: singleStudentModel.student?.createdAt ?? DateTime.now(),
        updatedAt: singleStudentModel.student?.updatedAt ?? DateTime.now(),
      ),
      referenceNo: '',
      paidOn: DateTime.now(),
      amountPaid: amount,
    );
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
}
