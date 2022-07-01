import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/partialpay_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/controller/verifypin_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:pinput/pinput.dart';

class InvoicePaymentPage extends StatefulWidget {
  SingleStudentModel singleStudentModel;

  InvoicePaymentPage({Key? key, required this.singleStudentModel})
      : super(key: key);

  @override
  State<InvoicePaymentPage> createState() => _InvoicePaymentPageState();
}

class _InvoicePaymentPageState extends State<InvoicePaymentPage> {
  final VerifyPinController verifyPinController =
  Get.put(VerifyPinController());
  final PartialPayController partialPayController =
  Get.put(PartialPayController());
  final UserController userController = Get.find<UserController>();

  TextEditingController feeController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      (widget.singleStudentModel.student!.totalBalanceAmount).abs() > 0
          ? FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r)),
        backgroundColor: PayNestTheme.blueAccent,
        onPressed: () {
          showMyModal(context);
          setState(() {
            // index = 1;
          });
        },
        // extendedPadding: EdgeInsets.symmetric(horizontal: 50.w),
        // icon:
        label: Obx(() =>
            SizedBox(
              width: 214.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(continueToPayment,
                      style: TextStyle(
                          color: PayNestTheme.colorWhite,
                          fontSize: 12.sp)),
                  !partialPayController.isLoading.value
                      ? Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                  )
                      : CircularProgressIndicator(
                    backgroundColor: PayNestTheme.colorWhite,
                    color: PayNestTheme.blueAccent,
                  ),
                ],
              ),
            )),
      )
          : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: PayNestTheme.primaryColor,
      body: Column(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 25.h),
                          child: Container(
                            height: 44.h,
                            width: 44.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back,
                                  size: 20.sp, color: PayNestTheme.blueAccent),
                              // child: Text(""),
                            ),
                          ),
                        ),
                        // Text(paynow,style: PayNestTheme.title20white,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // height: 1.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                  color: PayNestTheme.colorWhite,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(15.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(feepayment,
                          style: PayNestTheme.title22blackbold),
                      subtitle: Text(
                        invoiceDetails,
                        style: PayNestTheme.floating_14primaryColor,
                      ),
                      // trailing: OutlinedButton(
                      //   onPressed: (){},
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.arrow_drop_down,color:PayNestTheme.blueAccent,),
                      //       // Text(downloadInvoice,style: PayNestTheme.h2_12blueAccent,)
                      //     ],
                      //   )
                      // ),
                    ),
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
                    Text(
                      widget.singleStudentModel.student!.id.toString(),
                      style: PayNestTheme.title_3_16blackbold,
                    ),
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
                    Text(
                      widget.singleStudentModel.student!.firstName +
                          ' ' +
                          widget.singleStudentModel.student!.lastName,
                      style: PayNestTheme.title_3_16blackbold,
                    ),
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
                    Text(
                      widget.singleStudentModel.student!.grade,
                      style: PayNestTheme.title_3_16blackbold,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),
                    Text(
                      dueDate,
                      style: PayNestTheme.h2_14textGrey,
                    ),
                    Text(
                      widget.singleStudentModel.student!.dueDate.toString(),
                      style: PayNestTheme.title_3_16blackbold,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),
                    Text(
                      payableAmount,
                      style: PayNestTheme.h2_14textGrey,
                    ),
                    Text(
                      "AED " +
                          widget.singleStudentModel.student!.totalBalanceAmount
                              .toString(),
                      style: PayNestTheme.title24primaryColorBold,
                    ),
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
          ),
        ],
      ),
    );
  }

  Future<dynamic> showMyModal(BuildContext ctx) {
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      //Idhr singlechild and bottom padding add kari hay
      context: ctx,
      builder: (ctx) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 28.w,
                right: 28.w,
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 28.h, bottom: 28.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        enterAmount,
                        style: PayNestTheme.title18black,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(ctx);
                        },
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            color: PayNestTheme.blueAccent,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(Icons.clear,
                              color: PayNestTheme.colorWhite, size: 12.sp),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 1.sw,
                  height: 1.h,
                  color: PayNestTheme.lineColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  pleaseenteramount,
                  style: PayNestTheme.title_3_16black,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.h, top: 28.h),
                  child: Form(
                    key: Utils.feeAmountFormKey,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: feeController,
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: false),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        } else if (int.parse(feeController.text.toString()) >
                            widget.singleStudentModel.student!
                                .totalBalanceAmount) {
                          return "";
                        }
                      },
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0.r)),
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0.w)),
                        labelText: enterAmount,
                        // labelStyle: CustomizedTheme.b_W400_12,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1.sw,
                  height: 1.h,
                  color: PayNestTheme.lineColor,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 41.h, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentPayableMmount,
                        style: PayNestTheme.title_3_16black,
                      ),
                      Text(
                        "AED " +
                            widget
                                .singleStudentModel.student!.totalBalanceAmount.toString(),
                        style: PayNestTheme.title_2_16primaryColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.h,
                  width: 326.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: PayNestTheme.blueAccent,
                        elevation: 0,
                        // side: BorderSide(width:1, color:Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () async {
                        if (Utils.feeAmountFormKey.currentState!.validate()) {
                          Navigator.pop(ctx);
                          showCodeModal(context);
                        }
                      },
                      child:
                      Text(confirm, style: PayNestTheme.subtitle16white)),
                ),
              ],
            ),
          ),
        );
      },
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
      //Idhr singlechild and bottom padding add kari hay
      context: context,
      builder: (ctx) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 28.w,
                right: 28.w,
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 28.h, bottom: 28.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                            enterYourPin,
                            style: PayNestTheme.title22blackbold,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(ctx);
                        },
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            color: PayNestTheme.blueAccent,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(Icons.clear,
                              color: PayNestTheme.colorWhite, size: 12.sp),
                        ),
                      )
                    ],
                  ),
                ),
                Form(
                  key: Utils.pinFormKey,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
                      child: Pinput(
                        // obscureText: true,
                        controller: pinController,
                        defaultPinTheme: defaultPinTheme,
                        validator: (s) {
                          // return s == '2222' ? null : 'Pin is incorrect';
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
                Obx(() =>
                    SizedBox(
                      height: 60.h,
                      width: 326.w,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PayNestTheme.blueAccent,
                            elevation: 0,
                            // side: BorderSide(width:1, color:Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () async {
                            if (Utils.pinFormKey.currentState!.validate()) {
                              verifyPinController.hitVerifyPin(
                                  userController.userResData.value.parent!.id,
                                  pinController.text);
                              if (verifyPinController
                                  .verifyPinData.value.status ==
                                  true) {
                                Navigator.pop(context);

                                /// Implementation of partial payment
                                partialPayment();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(verifyPinController
                                            .verifyPinData.value.message
                                            .toString())));
                                pinController.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                        Text('Pin Verification failed')));
                                Navigator.pop(context);
                              }
                            } else {}
                          },
                          child: !verifyPinController.isLoading.value
                              ? Text(confirm,
                              style: PayNestTheme.subtitle16white)
                              : CircularProgressIndicator(
                            backgroundColor: PayNestTheme.colorWhite,
                            color: PayNestTheme.blueAccent,
                          )),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(
        fontSize: 20.sp,
        color: PayNestTheme.primaryColor,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: PayNestTheme.blueAccent),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  partialPayment() async {
    await partialPayController.hitPartialPay(
        widget.singleStudentModel.student!.id.toString(), feeController.text);
    if (partialPayController.partialPayData.value.status == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        // partialPayController.partialPayData.value.message.toString(),
          "Payment Successful")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Payment Failed')));
    }
  }
}
