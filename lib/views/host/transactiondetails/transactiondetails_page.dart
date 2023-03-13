import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/amount_formater.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../constants/constants.dart';
import '../../../data/model/datamodel/transactiondetail_model.dart';
import '../../../presentation/res/res.dart';
import '../../../widgets/back_button.dart';

class TransactionDetailsPage extends StatefulWidget {
  final TransactionDetailModel tdm;

  TransactionDetailsPage({Key? key, required this.tdm}) : super(key: key);

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300.h,
            child: Stack(
              children: [
                Container(
                  height: 210.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: PayNestTheme.primaryColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(24.r))),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.h, top: 25.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AppBarBackButton(
                                    iconColor: PayNestTheme.primaryColor,
                                    buttonColor: PayNestTheme.colorWhite,
                                  ),
                                  Text(
                                    recentTransaction,
                                    style: PayNestTheme.title20white.copyWith(
                                        fontSize: sizes.fontRatio * 18),
                                  ),
                                  SizedBox(
                                    height: 44.h,
                                    width: 44.w,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                    top: 70,
                    child:
                        // Obx(()=>
                        SizedBox(
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
                              // padding: EdgeInsets.symmetric(horizontal: 20.w),
                              width: 1.sw,
                              height: 110.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: horizontalValue(16),
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: PayNestTheme.dropShadow,
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                color: PayNestTheme.colorWhite,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Icon(Icons.check_circle,size: 50.sp,color: PayNestTheme.primaryColor,),
                                  // Image.asset(ic_schooldark,height: 50.h,width: 50.w,),
                                  Text(
                                    widget.tdm.school!.name,
                                    textAlign: TextAlign.center,
                                    style: PayNestTheme.h2_16textGrey.copyWith(
                                      color: PayNestTheme.black,
                                      fontSize: sizes.fontRatio * 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'montserratBold',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    DateFormat("yyyy-MM-dd")
                                        .format(widget.tdm.payedOn)
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: PayNestTheme.h2_14textGrey.copyWith(
                                        fontSize: sizes.fontRatio * 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: 0,
                          //   child: CircleAvatar(
                          //     radius: 46.r,
                          //     backgroundColor: PayNestTheme.blueAccent,
                          //     child: CircleAvatar(
                          //       backgroundImage: userController.userResData.value.parent!.profileImage == null ?
                          //       NetworkImage('https://cdn.pixabay.com/photo/2022/02/19/15/05/dark-7022879_960_720.jpg'):
                          //       NetworkImage(userController.userResData.value.parent!.profileImage),
                          //       radius: 45.r,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    )
                    // )
                    )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ListTile(
                    //   onTap: (){
                    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoicePaymentPage(singleStudentModel: widget.singleStudentModel)));
                    //   },
                    //   title:Text(feepayment,style: PayNestTheme.title_3_16black),
                    //   subtitle:Text(payment,style: PayNestTheme.floating_12primaryColor),
                    //   trailing:SvgPicture.asset(arrowNext),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12.r),
                    //       side: BorderSide(
                    //         width: 1.w,
                    //         color: PayNestTheme.borderGrey,
                    //       )
                    //   ),
                    // ),
                    /// Title
                    Text(
                      studentName,
                      style: PayNestTheme.title_2_16primaryColor
                          .copyWith(fontSize: sizes.fontRatio * 12),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                        widget.tdm.student!.firstName.toString() +
                            " " +
                            (widget.tdm.student!.lastName != '-'
                                ? widget.tdm.student!.lastName
                                : ''),
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                            color: PayNestTheme.textGrey,
                            fontSize: sizes.fontRatio * 16)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),
                    widget.tdm.student!.grade != '-'
                        ? Text(
                            studentClass,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontSize: sizes.fontRatio * 12,
                            ),
                          )
                        : const SizedBox.shrink(),
                    widget.tdm.student!.grade != '-'
                        ? SizedBox(
                            height: 5.h,
                          )
                        : const SizedBox.shrink(),
                    widget.tdm.student!.grade != '-'
                        ? Text(
                            "Grade " + widget.tdm.student!.grade.toString(),
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              color: PayNestTheme.textGrey,
                              fontSize: sizes.fontRatio * 16,
                            ),
                          )
                        : const SizedBox.shrink(),
                    widget.tdm.student!.grade != '-'
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: Container(
                              width: 1.sw,
                              height: 1.h,
                              color: PayNestTheme.lineColor,
                            ),
                          )
                        : const SizedBox.shrink(),

                    Text(
                      studentID,
                      style: PayNestTheme.title_2_16primaryColor
                          .copyWith(fontSize: sizes.fontRatio * 12),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(widget.tdm.studentId.toString(),
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                            color: PayNestTheme.textGrey,
                            fontSize: sizes.fontRatio * 16)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Text(
                      referenceNumber,
                      style: PayNestTheme.title_2_16primaryColor
                          .copyWith(fontSize: sizes.fontRatio * 12),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(widget.tdm.refNo.toString(),
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                            color: PayNestTheme.textGrey,
                            fontSize: sizes.fontRatio * 16)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Text(
                      amountPaid,
                      style: PayNestTheme.title_2_16primaryColor
                          .copyWith(fontSize: sizes.fontRatio * 12),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                        'AED ' +
                            amountFormater(double.parse(
                              widget.tdm.amount.toString(),
                            )),
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                            color: PayNestTheme.black,
                            fontSize: sizes.fontRatio * 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "montserratBold")),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    verticalSpacer(30),

                    Container(
                      width: double.infinity,
                      height: sizes.heightRatio * 46,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PayNestTheme.primaryColor,
                            elevation: 0,
                            // side: BorderSide(width:1, color:Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text(done,
                              style: PayNestTheme.subtitle16white
                                  .copyWith(fontSize: sizes.fontRatio * 14))),
                    )
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
