import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/presentation/res/assets.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../constants/constants.dart';
import '../../../data/model/response/transaction/pay_now_transaction_detail_model/pay_now_transaction_detail_model.dart';
import '../../../presentation/res/res.dart';
import '../../../widgets/amount_formater.dart';

class PayNowTransactionDetailsPage extends StatefulWidget {
  final PayNowTransactionDetailModel pntdm;

  const PayNowTransactionDetailsPage({super.key, required this.pntdm});

  @override
  State<PayNowTransactionDetailsPage> createState() =>
      _PayNowTransactionDetailsPageState();
}

class _PayNowTransactionDetailsPageState
    extends State<PayNowTransactionDetailsPage> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 350.h,
            child: Stack(
              children: [
                Container(
                  height: 210.h,
                  width: 1.sw,
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
                      padding: EdgeInsets.only(left: 25.h, top: 25.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          verticalSpacer(16),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Invoice Details',
                              textAlign: TextAlign.center,
                              style: PayNestTheme.title20white.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'montserratBold',
                                fontSize: sizes.fontRatio * 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 90,
                  child: SizedBox(
                    width: 1.sw,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            right: 25.w,
                            top: 30.h,
                          ),
                          child: Container(
                            width: 1.sw,
                            height: 223.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: PayNestTheme.borderGrey,
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(
                                    0,
                                    3,
                                  ),
                                ),
                              ],
                              color: PayNestTheme.colorWhite,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  AppAssets().successCheckAnimation,
                                  height: sizes.heightRatio * 104,
                                  width: sizes.widthRatio * 104,
                                ),
                                Text(
                                  congratulations,
                                  style: PayNestTheme.title24primaryColorBold
                                      .copyWith(
                                    fontFamily: 'montserratBold',
                                    fontSize: sizes.fontRatio * 22,
                                  ),
                                ),
                                verticalSpacer(8),
                                SizedBox(
                                  width: sizes.width / 1.4,
                                  child: Text(
                                    youHaveSuccessfully,
                                    textAlign: TextAlign.center,
                                    style: PayNestTheme.title24primaryColorBold
                                        .copyWith(
                                      fontFamily: 'montserratRegular',
                                      fontSize: sizes.fontRatio * 14,
                                      color: PayNestTheme.lightBlack,
                                    ),
                                  ),
                                ),
                                verticalSpacer(16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 34.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      (widget.pntdm.student?.firstName ?? '') +
                          (widget.pntdm.student?.lastName != '-'
                              ? widget.pntdm.student!.lastName
                              : ''),
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    widget.pntdm.student!.grade != '-'
                        ? verticalSpacer(16)
                        : const SizedBox.shrink(),
                    widget.pntdm.student!.grade != '-'
                        ? Text(
                            studentClass,
                            style: PayNestTheme.h2_14textGrey.copyWith(
                              color: PayNestTheme.primaryColor,
                              fontFamily: 'montserratBold',
                              fontSize: sizes.fontRatio * 12,
                            ),
                          )
                        : const SizedBox.shrink(),
                    widget.pntdm.student!.grade != '-'
                        ? verticalSpacer(4)
                        : const SizedBox.shrink(),
                    widget.pntdm.student!.grade != '-'
                        ? Text(
                            "Grade ${widget.pntdm.student!.grade}",
                            style: PayNestTheme.title_3_16blackbold.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.lightBlack,
                              fontFamily: 'montserratSemiBold',
                            ),
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(4),
                    widget.pntdm.student!.grade != '-'
                        ? Container(
                            width: 1.sw,
                            height: 1.h,
                            color: PayNestTheme.lineColor,
                          )
                        : const SizedBox.shrink(),
                    verticalSpacer(16),
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
                      widget.pntdm.student?.id.toString() ?? '-',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(16),
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
                      widget.pntdm.student?.studentRegNo.toString() ?? '-',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(16),
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
                      widget.pntdm.schoolName ?? '-',
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                    ),
                    verticalSpacer(4),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(16),
                    Text(
                      amountPaid,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'AED ${amountFormater(double.parse(
                        widget.pntdm.amountPaid.toString(),
                      ))}',
                      style: PayNestTheme.title_3_16black.copyWith(
                        fontSize: sizes.fontRatio * 22,
                      ),
                    ),
                    verticalSpacer(20),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalValue(30)),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PayNestTheme.primaryColor,
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
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/DashboardPage',
                    (Route<dynamic> route) => false,
                  );
                },
                child: Center(
                  child: Text(
                    done,
                    style: PayNestTheme.title_2_16primaryColor.copyWith(
                      fontFamily: 'montserratBold',
                      fontSize: sizes.fontRatio * 14,
                      color: PayNestTheme.colorWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
          verticalSpacer(10)
        ],
      ),
    );
  }
}
