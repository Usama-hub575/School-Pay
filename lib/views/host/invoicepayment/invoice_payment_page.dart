import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/partialpay_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/controller/verifypin_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:paynest_flutter_app/views/host/invoicepayment/widget/amount_bottom_sheet.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import 'package:pinput/pinput.dart';

class InvoicePaymentPage extends StatefulWidget {
  SingleStudentModel singleStudentModel;

  InvoicePaymentPage({Key? key, required this.singleStudentModel})
      : super(key: key);

  @override
  State<InvoicePaymentPage> createState() => _InvoicePaymentPageState();
}

class _InvoicePaymentPageState extends State<InvoicePaymentPage> {
  final VerifyPinController verifyPinController = Get.put(
    VerifyPinController(),
  );
  final PartialPayController partialPayController = Get.put(
    PartialPayController(),
  );
  final UserController userController = Get.find<UserController>();

  TextEditingController feeController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  int index = 1;

  @override
  Widget build(BuildContext context) {
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
                      Container(
                        height: 44.h,
                        width: 44.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 20.sp,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        payments,
                        style: PayNestTheme.title20white.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'montserratBold',
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
                    verticalSpacer(32),
                    Text(
                      downloadPaymentInvoice,
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratExtraBold',
                      ),
                    ),
                    verticalSpacer(16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: PayNestTheme.colorWhite,
                          elevation: 0,
                          side: BorderSide(
                            width: 1,
                            color: PayNestTheme.primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              14,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: verticalValue(14),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Spacer(),
                            _getArrowDown(),
                            horizontalSpacer(8),
                            Center(
                              child: Text(
                                downloadInvoice,
                                style: PayNestTheme.title_2_16primaryColor
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: sizes.fontRatio * 14,
                                        color: PayNestTheme.black),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    verticalSpacer(16),
                    Text(
                      invoiceDetails,
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 14,
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratExtraBold',
                      ),
                    ),
                    verticalSpacer(16),
                    Text(
                      studentName,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      '${widget.singleStudentModel.student!.firstName.toString()}  ${widget.singleStudentModel.student!.lastName.toString()}',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(8),
                    Text(
                      studentclass,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      'Grade ${widget.singleStudentModel.student!.grade}',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(8),
                    Text(
                      studentID,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      '${widget.singleStudentModel.student!.id}',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(8),
                    Text(
                      referenceNumber,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      '${widget.singleStudentModel.student!.studentRegNo}',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(8),
                    Text(
                      schoolName,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      '${widget.singleStudentModel.student!.school!.name}',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(8),
                    Text(
                      dueDate,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      'AED ${DateFormat("yyyy-MM-dd").format(widget.singleStudentModel.student!.dueDate)}',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(16),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(16),
                    Text(
                      amountToBePaid,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      '${widget.singleStudentModel.student!.totalBalanceAmount}',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 22,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(24),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: PayNestTheme.colorWhite,
                          elevation: 0,
                          side: BorderSide(
                            width: 1,
                            color: PayNestTheme.primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              14,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: verticalValue(14),
                          ),
                        ),
                        onPressed: () {
                          AmountBottomSheet.show(
                            singleStudentModel: widget.singleStudentModel,
                            context: context,
                            onTap: () {
                              Navigator.of(context).pop();
                              showCodeModal(
                                context,
                              );
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            continueToPayment,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: PayNestTheme.primaryColor,
                            ),
                          ),
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

  Future<dynamic> showCodeModal(BuildContext context) {
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      context: context,
      builder: (ctx) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 28.w,
              right: 28.w,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                verticalSpacer(16),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(16),
                  ),
                  child: Text(
                    enterYourPin,
                    textAlign: TextAlign.center,
                    style: PayNestTheme.title22blackbold.copyWith(
                      fontSize: sizes.fontRatio * 16,
                      color: PayNestTheme.primaryColor,
                    ),
                  ),
                ),
                Form(
                  key: Utils.pinFormKey,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                      child: Pinput(
                        defaultPinTheme: PinTheme(
                          textStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: PayNestTheme.black,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: PayNestTheme.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          width: sizes.widthRatio * 80,
                          height: sizes.heightRatio * 50,
                        ),
                        controller: pinController,
                        validator: (s) {
                          return s!.isEmpty
                              ? 'Enter Pin'
                              : s.length < 4
                                  ? '4 Digit Pin '
                                  : null;
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) => print(pin),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: PayNestTheme.colorWhite,
                        elevation: 0,
                        side: BorderSide(
                          width: 1,
                          color: PayNestTheme.primaryColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            14,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: verticalValue(14),
                        ),
                      ),
                      onPressed: () {
                        if (Utils.pinFormKey.currentState!.validate()) {
                          verifyPinController.hitVerifyPin(
                              userController.userResData.value.parent!.id,
                              pinController.text);
                          if (verifyPinController.verifyPinData.value.status ==
                              true) {
                            Navigator.pop(context);
                            partialPayment();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  verifyPinController
                                      .verifyPinData.value.message
                                      .toString(),
                                ),
                              ),
                            );
                            pinController.clear();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Pin Verification failed',
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        } else {}
                      },
                      child: Center(
                        child: !verifyPinController.isLoading.value
                            ? Text(
                                continueTo,
                                style: PayNestTheme.title_2_16primaryColor
                                    .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: PayNestTheme.primaryColor,
                                ),
                              )
                            : CircularProgressIndicator(
                                backgroundColor: PayNestTheme.colorWhite,
                                color: PayNestTheme.blueAccent,
                              ),
                      ),
                    ),
                  ),
                ),
                verticalSpacer(16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getArrowDown() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: PayNestTheme.black.withOpacity(0.6),
        ),
      ),
      child: Icon(
        Icons.arrow_downward,
        color: PayNestTheme.black,
        size: sizes.fontRatio * 16,
      ),
    );
  }

  partialPayment() async {
    await partialPayController.hitPartialPay(
        widget.singleStudentModel.student!.id.toString(), feeController.text);
    if (partialPayController.partialPayData.value.status == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Payment Successful"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment Failed'),
        ),
      );
    }
  }
}
