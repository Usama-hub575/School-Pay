import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/transactiondetail_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

import '../../../constants/constants.dart';

class TransactionDetailsPage extends StatefulWidget {
  TransactionDetailModel tdm;
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
            height: 350.h,
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
                                  Padding(
                                    padding: EdgeInsets.only(right: 25.w),
                                    child: Container(
                                      height: 44.h,
                                      width: 44.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.r)),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.arrow_back,
                                            size: 20.sp,
                                            color: PayNestTheme.blueAccent),
                                        // child: Text(""),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    recentTransaction,
                                    style: PayNestTheme.title20white,
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
                                left: 25.w, right: 25.w, top: 30.h),
                            child: Container(
                              // padding: EdgeInsets.symmetric(horizontal: 20.w),
                              width: 1.sw,
                              height: 118.h,
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
                                  SizedBox(
                                    height: 13.h,
                                  ),
                                  Text(
                                    congratulations,
                                    style: PayNestTheme.title24primaryColorBold,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    youHaveSuccessfully,
                                    style: PayNestTheme.h2_14textGrey,
                                  ),
                                  SizedBox(
                                    height: 31.h,
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
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 34.h),
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
                      invoiceDetails,
                      style: PayNestTheme.title_2_16primaryColor,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    Text(
                      referenceNumber,
                      style: PayNestTheme.h2_14textGrey,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(widget.tdm.refNo.toString(),
                        style: PayNestTheme.title_3_16black),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Text(
                      studentID,
                      style: PayNestTheme.h2_14textGrey,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(widget.tdm.studentId.toString(),
                        style: PayNestTheme.title_3_16black),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Text(
                      studentName,
                      style: PayNestTheme.h2_14textGrey,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                        widget.tdm.student!.firstName.toString() +
                            " " +
                            widget.tdm.student!.lastName.toString(),
                        style: PayNestTheme.title_3_16black),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Text(
                      studentclass,
                      style: PayNestTheme.h2_14textGrey,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text("Grade " + widget.tdm.student!.grade.toString(),
                        style: PayNestTheme.title_3_16black),
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
                      style: PayNestTheme.h2_14textGrey,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('AED ' + widget.tdm.amount.toString(),
                        style: PayNestTheme.title_3_16black),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Text(
                      paidon,
                      style: PayNestTheme.h2_14textGrey,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                        DateFormat("yyyy-MM-dd")
                            .format(widget.tdm.payedOn)
                            .toString(),
                        style: PayNestTheme.title_3_16black),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Text(
                      dueAmount,
                      style: PayNestTheme.h2_14textGrey,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                        'AED ' +
                            widget.tdm.student!.totalBalanceAmount.toString(),
                        style: PayNestTheme.title_3_16black),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),
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
