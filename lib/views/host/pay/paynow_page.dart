import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/createtransaction_resp_controller.dart';
import 'package:paynest_flutter_app/controller/myStudent_controller.dart';
import 'package:paynest_flutter_app/controller/paynow_controller.dart';
import 'package:paynest_flutter_app/controller/updatebank_response_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/paynowtransaction_detail_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/transactiondetails/paynowltransactiondetails_page.dart';
import 'package:paynest_flutter_app/views/webview/webview.dart';

class PayNowPage extends StatefulWidget {
  final String whichStack;

  const PayNowPage({required this.whichStack, Key? key}) : super(key: key);

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
        floatingActionButton: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          backgroundColor: PayNestTheme.blueAccent,
          onPressed: () async {
            if (studentController.myStudentData.value.status &&
                int.parse(amountController.text) > 0) {
              print("Student data for Payment to CBD");
              print(studentIDController.text +
                  parentIDController.text +
                  schoolIDController.text);
              // schoolId=56&parentId=225&studentId=638
              await ctrcController.hitCreateTransaction(
                  schoolIDController.text,
                  parentIDController.text,
                  studentIDController.text,
                  amountController.text);
              // ctrcController.createTransData.value.status == true ?
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (BuildContext context) => MyWebView(
              //     title: "CBD",
              //     resID: ctrcController.createTransData.value.transaction!.id,
              //     amount: amountController.text,
              //     indx: idx,
              //   )
              // )):ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text("Some error occurred"),backgroundColor: Colors.red,));

              if (ctrcController.createTransData.value.status == true) {
                final result =
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyWebView(
                              title: "CBD",
                              resID: ctrcController
                                  .createTransData.value.transaction!.id,
                              amount: amountController.text,
                              indx: idx,
                            )));
                print("Response from my data" + result.toString());

                if (result == true) {
                  var amountt = amountController.text;
                  studentController.myStudentData.update((val) {
                    setState(() {
                      val!.students![idx].student!.totalBalanceAmount = "0";
                      amountController.text = "0";
                    });
                    PayNowTransactionDetailModel model =
                        PayNowTransactionDetailModel(
                      student: PayNowTransactionDetailStudent(
                          id: sbrController.bankResponseData.value.student!.id,
                          studentRegNo: sbrController
                              .bankResponseData.value.student!.studentRegNo,
                          firstName: sbrController
                              .bankResponseData.value.student!.firstName,
                          lastName: sbrController
                              .bankResponseData.value.student!.lastName,
                          grade: sbrController
                              .bankResponseData.value.student!.grade,
                          parentEmiratesId: sbrController
                              .bankResponseData.value.student!.parentEmiratesId,
                          parentPhoneNumber: sbrController.bankResponseData
                              .value.student!.parentPhoneNumber,
                          dob:
                              sbrController.bankResponseData.value.student!.dob,
                          admissionDate: sbrController
                              .bankResponseData.value.student!.admissionDate,
                          deletedAt: sbrController
                              .bankResponseData.value.student!.deletedAt,
                          schoolId: sbrController
                              .bankResponseData.value.student!.schoolId,
                          totalBalanceAmount: sbrController.bankResponseData
                              .value.student!.totalBalanceAmount,
                          guardianFirstName: sbrController.bankResponseData
                              .value.student!.guardianFirstName,
                          guardianLastName: sbrController
                              .bankResponseData.value.student!.guardianLastName,
                          guardianGender:
                              sbrController.bankResponseData.value.student!.guardianGender,
                          guardianEmiratesId: sbrController.bankResponseData.value.student!.guardianEmiratesId,
                          guardianNationality: sbrController.bankResponseData.value.student!.guardianNationality,
                          guardianReligion: sbrController.bankResponseData.value.student!.guardianReligion,
                          area: sbrController.bankResponseData.value.student!.area,
                          region: sbrController.bankResponseData.value.student!.region,
                          streetAddress: sbrController.bankResponseData.value.student!.streetAddress,
                          email: sbrController.bankResponseData.value.student!.email,
                          phoneNumber: sbrController.bankResponseData.value.student!.phoneNumber,
                          otherNumber: sbrController.bankResponseData.value.student!.otherNumber,
                          profile: sbrController.bankResponseData.value.student!.profile,
                          religion: sbrController.bankResponseData.value.student!.religion,
                          nationality: sbrController.bankResponseData.value.student!.nationality,
                          gender: sbrController.bankResponseData.value.student!.gender,
                          dueDate: sbrController.bankResponseData.value.student!.dueDate,
                          file: sbrController.bankResponseData.value.student!.file,
                          privacy: sbrController.bankResponseData.value.student!.privacy,
                          createdAt: sbrController.bankResponseData.value.student!.createdAt,
                          updatedAt: sbrController.bankResponseData.value.student!.updatedAt),
                      referenceNo:
                          sbrController.bankResponseData.value.referenceNo,
                      paidOn: sbrController.bankResponseData.value.paidOn,
                      amountPaid: amountt,
                    );
                    !sbrController.isLoading.value
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PayNowTransactionDetailsPage(
                                  pntdm: model,
                                )))
                        : CircularProgressIndicator();
                  });
                }
                // result == true ? studentController.myStudentData.update((val) {
                //   var amountt = amountController.text;
                //   setState(() {
                //     val!.students![idx].student!.totalBalanceAmount = "0";
                //     amountController.text = "0";
                //   });
                //   PayNowTransactionDetailModel model = PayNowTransactionDetailModel(
                //     student: PayNowTransactionDetailStudent(
                //         id: sbrController.bankResponseData.value.student!.id,
                //         studentRegNo: sbrController.bankResponseData.value.student!.studentRegNo,
                //         firstName: sbrController.bankResponseData.value.student!.firstName,
                //         lastName: sbrController.bankResponseData.value.student!.lastName,
                //         grade: sbrController.bankResponseData.value.student!.grade,
                //         parentEmiratesId: sbrController.bankResponseData.value.student!.parentEmiratesId,
                //         parentPhoneNumber: sbrController.bankResponseData.value.student!.parentPhoneNumber,
                //         dob: sbrController.bankResponseData.value.student!.dob,
                //         admissionDate: sbrController.bankResponseData.value.student!.admissionDate,
                //         deletedAt: sbrController.bankResponseData.value.student!.deletedAt,
                //         schoolId: sbrController.bankResponseData.value.student!.schoolId,
                //         totalBalanceAmount: sbrController.bankResponseData.value.student!.totalBalanceAmount,
                //         guardianFirstName: sbrController.bankResponseData.value.student!.guardianFirstName,
                //         guardianLastName: sbrController.bankResponseData.value.student!.guardianLastName,
                //         guardianGender: sbrController.bankResponseData.value.student!.guardianGender,
                //         guardianEmiratesId: sbrController.bankResponseData.value.student!.guardianEmiratesId,
                //         guardianNationality: sbrController.bankResponseData.value.student!.guardianNationality,
                //         guardianReligion: sbrController.bankResponseData.value.student!.guardianReligion,
                //         area: sbrController.bankResponseData.value.student!.area,
                //         region: sbrController.bankResponseData.value.student!.region,
                //         streetAddress: sbrController.bankResponseData.value.student!.streetAddress,
                //         email: sbrController.bankResponseData.value.student!.email,
                //         phoneNumber: sbrController.bankResponseData.value.student!.phoneNumber,
                //         otherNumber: sbrController.bankResponseData.value.student!.otherNumber,
                //         profile: sbrController.bankResponseData.value.student!.profile,
                //         religion: sbrController.bankResponseData.value.student!.religion,
                //         nationality: sbrController.bankResponseData.value.student!.nationality,
                //         gender: sbrController.bankResponseData.value.student!.gender,
                //         dueDate: sbrController.bankResponseData.value.student!.dueDate,
                //         file: sbrController.bankResponseData.value.student!.file,
                //         privacy: sbrController.bankResponseData.value.student!.privacy,
                //         createdAt: sbrController.bankResponseData.value.student!.createdAt,
                //         updatedAt: sbrController.bankResponseData.value.student!.updatedAt
                //     ),
                //     referenceNo: sbrController.bankResponseData.value.referenceNo,
                //     paidOn: sbrController.bankResponseData.value.paidOn,
                //     amountPaid: amountt,
                //   );
                //   !sbrController.isLoading.value ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => PayNowTransactionDetailsPage(
                //     pntdm: model,
                //   ))):CircularProgressIndicator();
                // }):null;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text("Some error occurred"),
                  backgroundColor: Colors.red,
                ));
              }

              // payNowController.hitPayNow(amountController.text, parentIDController.text, studentIDController.text);
              // print("${amountController.text+parentIDController.text+ studentIDController.text}");
              // String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
              // RegExp regExp = RegExp(pattern);
              // if((payNowController.payNowData.value.url.isEmpty)){
              //
              // }else {
              //   setState(() {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (BuildContext context) => MyWebView(
              //             title: "CBD",
              //             selectedUrl: payNowController.payNowData.value.url,
              //             hiddenData : payNowController.payNowData.value.hiddendata
              //         )
              //     ));
              //   });
              // }

            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Fees already paid"),
                backgroundColor: Colors.green,
              ));
            }
          },
          label: SizedBox(
            width: .8.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "AED " + amountController.text,
                  style: PayNestTheme.subtitle16white,
                ),
                !payNowController.isLoading.value
                    ? Text(
                        paynow,
                        style: PayNestTheme.small_2_14colorWhite,
                      )
                    : CircularProgressIndicator(
                        color: PayNestTheme.colorWhite,
                        backgroundColor: PayNestTheme.blueAccent,
                      ),
                // Icon(Icons.play_circle_fill,color: Colors.white,),
                // : CircularProgressIndicator(backgroundColor: PayNestTheme.colorWhite,color: PayNestTheme.blueAccent,),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [
            Container(
              height: 129.h,
              width: MediaQuery.of(context).size.width,
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
                          Text(
                            paynow,
                            style: PayNestTheme.title20white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: PayNestTheme.colorWhite,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: studentController.myStudentData.value.status
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              paymentfor,
                              style: PayNestTheme.title_2_16primaryColor,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 25.h),
                              child: SizedBox(
                                height: 90.h,
                                width: 1.sw,
                                child: ListView.builder(
                                    itemCount: studentController
                                        .myStudentData.value.students!.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: SizedBox(
                                          // height: 84.h,
                                          width: 100.w,
                                          child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              // backgroundColor:idx == index ? Colors.blue:Colors.black,
                                              elevation: 0,
                                              side: BorderSide(
                                                  width: 1,
                                                  color: idx == index
                                                      ? PayNestTheme.blueAccent
                                                      : PayNestTheme
                                                          .borderGrey),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                            onPressed: () {
                                              setState(
                                                () {
                                                  idx = index;
                                                  amountController.text =
                                                      studentController
                                                          .myStudentData
                                                          .value
                                                          .students![index]
                                                          .student!
                                                          .totalBalanceAmount;
                                                  studentIDController.text =
                                                      studentController
                                                          .myStudentData
                                                          .value
                                                          .students![index]
                                                          .studentId
                                                          .toString();
                                                  parentIDController.text =
                                                      studentController
                                                          .myStudentData
                                                          .value
                                                          .students![index]
                                                          .parentId
                                                          .toString();
                                                  schoolIDController.text =
                                                      studentController
                                                          .myStudentData
                                                          .value
                                                          .students![index]
                                                          .student!
                                                          .schoolId
                                                          .toString();
                                                  print(idx);
                                                },
                                              );
                                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectSchool()));
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 18.r,
                                                ),
                                                SizedBox(
                                                  height: 15.h,
                                                ),
                                                Text(
                                                  studentController
                                                          .myStudentData
                                                          .value
                                                          .students![index]
                                                          .student!
                                                          .firstName +
                                                      " " +
                                                      studentController
                                                          .myStudentData
                                                          .value
                                                          .students![index]
                                                          .student!
                                                          .lastName,
                                                  style: PayNestTheme
                                                      .h2_12blueAccentLight,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  currentPayableamount,
                                  style: PayNestTheme.title_3_16black,
                                ),
                                Text(
                                  "AED " + amountController.text,
                                  style: PayNestTheme.title_2_16primaryColor,
                                ),
                              ],
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
