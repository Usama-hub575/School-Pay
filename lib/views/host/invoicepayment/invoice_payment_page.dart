import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/partialpay_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/controller/verifypin_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/invoicepayment/widget/amount_bottom_sheet.dart';
import 'package:paynest_flutter_app/views/host/payment_method/payment_method.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../data/model/datamodel/singlestudent_model.dart';
import '../../../presentation/res/res.dart';
import '../../../widgets/amount_formater.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/toast.dart';
import '../../download_pdf/download_pdf.dart';

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
  bool isLoading = false;

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PayNestTheme.primaryColor,
      body: Column(
        children: [
          Container(
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
                      horizontalSpacer(65),
                      Text(
                        payments,
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
          verticalSpacer(16),
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
                    verticalSpacer(50),
                    Text(
                      invoiceDetails,
                      style: PayNestTheme.h2_12blueAccent.copyWith(
                        fontSize: sizes.fontRatio * 16,
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
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      '${widget.singleStudentModel.student!.firstName.toString()}  ${(widget.singleStudentModel.student?.lastName != '-' ? widget.singleStudentModel.student!.lastName : '')}',
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
                    widget.singleStudentModel.student!.grade != '-'
                        ? Text(
                            studentclass,
                            style: PayNestTheme.h2_14textGrey.copyWith(
                              color: PayNestTheme.primaryColor,
                              fontFamily: 'montserratBold',
                              fontSize: sizes.fontRatio * 12,
                            ),
                          )
                        : const SizedBox.shrink(),
                    widget.singleStudentModel.student!.grade != '-' ? verticalSpacer(4): const SizedBox.shrink(),
                    widget.singleStudentModel.student!.grade != '-'
                        ? Text(
                            'Grade ${widget.singleStudentModel.student!.grade}',
                            style: PayNestTheme.title_3_16blackbold.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.lightBlack,
                              fontFamily: 'montserratSemiBold',
                            ),
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(8),
                    widget.singleStudentModel.student!.grade != '-'
                        ? Container(
                            width: 1.sw,
                            height: 1.h,
                            color: PayNestTheme.lineColor,
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(8),
                    Text(
                      studentID,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 12,
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
                        fontSize: sizes.fontRatio * 12,
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
                        fontSize: sizes.fontRatio * 12,
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
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(4),
                    Text(
                      '${DateFormat("yyyy-MM-dd").format(widget.singleStudentModel.student!.dueDate)}',
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
                      amountFormater(
                        double.parse(
                          widget.singleStudentModel.student!.totalBalanceAmount
                              .toString(),
                        ),
                      ),
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
                            onTap: (value) {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PaymentMethod(
                                    singleStudentModel:
                                        widget.singleStudentModel,
                                    payment: value,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            continueToPayment,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: sizes.fontRatio * 14,
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
      showToast(
          context: context,
          messege: 'Payment Successful',
          color: PayNestTheme.primaryColor);
    } else {
      showToast(
          context: context, messege: 'Payment Failed', color: PayNestTheme.red);
    }
  }

  Future generateScreenshotImages(String fileName) async {
    setState(() {
      isLoading = true;
    });
    final pdfFile = await PdfApi.generatePdfFile(
      widget.singleStudentModel,
    );

    PdfApi.openFile(file: File(pdfFile.path));

    setState(() {
      isLoading = false;
    });

    showToast(
        context: context,
        messege: 'Successful!',
        color: PayNestTheme.primaryColor);
  }
}
