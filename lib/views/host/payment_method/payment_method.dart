import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lean_sdk_flutter/lean_sdk_flutter.dart';
import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/service/api_service.dart';

import '../../../controller/createtransaction_resp_controller.dart';
import '../../../controller/myStudent_controller.dart';
import '../../../data/model/datamodel/single_student_model.dart';
import '../../../data/model/lean_payment_model.dart';
import '../../webview/webview.dart';

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

  bool isLoading = false;
  var appToken = "";
  var customerId = "";
  var reconnectId = "";
  var paymentDestinationId = "";
  var paymentIntentId = "";
  List<Permission> permissions = [
    Permission.identity,
    Permission.transactions,
    Permission.balance,
    Permission.accounts,
    Permission.payments
  ];
  var isSandbox = true;

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
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalSpacer(16),
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
                    verticalSpacer(50),
                    Text(
                      selectPaymentsMethod,
                      style: PayNestTheme.h2_14blueAccent.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontSize: sizes.fontRatio * 16,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(10),
                    Text(
                      selectPaymentsMethodSecure,
                      style: PayNestTheme.small_2_10textGrey.copyWith(
                        color: PayNestTheme.lightBlack,
                        fontSize: sizes.fontRatio * 12,
                        fontFamily: 'montserratMedium',
                      ),
                    ),
                    verticalSpacer(10),
                    Container(
                      width: sizes.widthRatio * 284,
                      height: sizes.heightRatio * 284,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          AppAssets().icPaymentMethod,
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
                              offset: const Offset(1, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            horizontalSpacer(16),
                            commercialImage(
                              imagePath: AppAssets().icCommercialBank,
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
                        if (isLeanEnable) {
                          if (widget.payment <= 0) {
                            showToast(
                              message: "Amount Should Be Grater Then 0!",
                              context: context,
                              color: Colors.red,
                            );
                          } else {
                            onLeanPaymentTap();
                          }
                        } else {
                          showToast(
                            message: 'Service Unavailable',
                            context: context,
                            color: PayNestTheme.primaryColor,
                          );
                        }
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
                              offset: const Offset(1, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            horizontalSpacer(32),
                            _otherImage(
                              opacity: isLeanEnable ? 1 : 0.5,
                              imagePath: AppAssets().icLean,
                            ),
                            horizontalSpacer(16),
                            Expanded(
                              child: Center(
                                child: Text(
                                  payByBankTransfer,
                                  textAlign: TextAlign.center,
                                  style: isLeanEnable
                                      ? PayNestTheme.title_2_16primaryColor
                                          .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: sizes.fontRatio * 14,
                                          color: PayNestTheme.primaryColor,
                                        )
                                      : PayNestTheme.title_2_16primaryColor
                                          .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: sizes.fontRatio * 14,
                                          color: PayNestTheme.primaryColor
                                              .withOpacity(
                                            0.5,
                                          ),
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
                            message: 'Coming Soon!',
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
                              offset: const Offset(1, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            horizontalSpacer(32),
                            _otherImage(
                              opacity: 0.5,
                              imagePath: AppAssets().icPostPay,
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

  _connect() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Lean.connect(
              appToken: appToken,
              customerId: customerId,
              permissions: permissions,
              isSandbox: isSandbox,
              callback: (resp) async {
                var results = jsonDecode(resp);
                if (results['status'] == 'SUCCESS') {
                  Navigator.pop(context);
                  var data = {
                    "schoolId": widget.singleStudentModel.student!.schoolId,
                    "amount": widget.payment,
                    "studentId": widget.singleStudentModel.studentId,
                  };
                  var createPaymentIntent =
                      await APIService().createPaymentIntent(
                    jsonEncode(data),
                  );
                  var leanPaymentDecoded = jsonDecode(createPaymentIntent);
                  CreatePaymentIntentModel createPaymentIntentModel =
                      CreatePaymentIntentModel.fromJson(leanPaymentDecoded);
                  if (createPaymentIntentModel.status!) {
                    appToken =
                        createPaymentIntentModel.data!.leanAppToken.toString();
                    paymentIntentId = createPaymentIntentModel
                        .data!.paymentIntentId
                        .toString();
                    await _pay(
                      model: createPaymentIntentModel,
                    );
                  }
                } else {
                  showToast(
                    context: context,
                    message: results['message'],
                    color: PayNestTheme.red,
                  );
                  Navigator.pop(context);
                }
              },
              actionCancelled: () => Navigator.pop(context),
            ),
          );
        });
  }

  Future onLeanPaymentTap() async {
    var res = await APIService().leanPayment();
    var decoded = jsonDecode(res);
    LeanPaymentModel leanPaymentModel = LeanPaymentModel.fromJson(decoded);
    appToken = leanPaymentModel.response!.leanAppToken.toString();
    customerId = leanPaymentModel.response!.leanCustomerId.toString();
    if (!leanPaymentModel.status!) {
      _connect();
    } else {
      var data = {
        "schoolId": widget.singleStudentModel.student!.schoolId,
        "amount": widget.payment,
        "studentId": widget.singleStudentModel.studentId,
      };
      var createPaymentIntent = await APIService().createPaymentIntent(
        jsonEncode(data),
      );
      var leanPaymentDecoded = jsonDecode(createPaymentIntent);
      CreatePaymentIntentModel createPaymentIntentModel =
          CreatePaymentIntentModel.fromJson(leanPaymentDecoded);
      if (createPaymentIntentModel.status!) {
        appToken = createPaymentIntentModel.data!.leanAppToken.toString();
        paymentIntentId =
            createPaymentIntentModel.data!.paymentIntentId.toString();
        await _pay(
          model: createPaymentIntentModel,
        );
      }
    }
  }

  Future<void> _pay({
    required CreatePaymentIntentModel model,
  }) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Lean.pay(
            appToken: model.data!.leanAppToken!,
            paymentIntentId: model.data!.paymentIntentId!,
            country: Country.uae,
            isSandbox: isSandbox,
            callback: (resp) {
              jsonDecode(resp.toString());
              LeanServerResponse leanResponse = LeanServerResponse.fromJson(
                jsonDecode(resp.toString()),
              );
              showToast(
                message: leanResponse.message ?? '',
                context: context,
                color: leanResponse.status == 'SUCCESS'
                    ? Colors.green
                    : Colors.redAccent,
              );
              Navigator.pop(context);
              if (leanResponse.status == 'SUCCESS') {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/DashboardPage',
                  (Route<dynamic> route) => false,
                );
              }
            },
            actionCancelled: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  Future onPaymentPress() async {
    if (studentController.myStudentData.value.status) {
      if (widget.payment > 0) {
        int orderId = Random().nextInt(
          1000000000,
        );
        isLoading = true;
        if (mounted) {
          setState(() {});
        }
        final response = await ctrcController.hitCreateTransaction(
          widget.singleStudentModel.student!.schoolId.toString(),
          widget.singleStudentModel.parentId.toString(),
          widget.singleStudentModel.student!.id.toString(),
          widget.payment.toString(),
          orderId.toString(),
        );
        if (response) {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => MyWebView(
                title: "CBD",
                amount: widget.payment.toString(),
                indx: 0,
                orderId: orderId,
                schoolId: widget.singleStudentModel.student!.schoolId,
              ),
            ),
          );
          if (result != null && result) {
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
                  widget.payment.toString(),
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
                          payNowTransactionDetailModel: model,
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
                    message: 'Something went wrong with the transaction',
                    color: PayNestTheme.red,
                  );
                },
              );
            }
          }
        }
      } else if (widget.payment < 0) {
        isLoading = false;
        setState(() {});
        Future.delayed(
          Duration.zero,
          () {
            showToast(
              context: context,
              message: 'Amount is not correct',
              color: PayNestTheme.red,
            );
          },
        );
      } else if (widget.payment == 0) {
        isLoading = false;
        setState(() {});
        Future.delayed(
          Duration.zero,
          () {
            showToast(
              context: context,
              message: 'Fees already paid',
              color: Colors.green,
            );
          },
        );
      }
    } else {
      if (mounted) {
        isLoading = false;
        setState(() {});
        Future.delayed(
          Duration.zero,
          () {
            showToast(
              context: context,
              message: 'Something went wrong',
              color: PayNestTheme.red,
            );
          },
        );
      }
    }
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

Widget commercialImage({required String imagePath}) {
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

Widget _otherImage({required String imagePath, required double opacity}) {
  return Opacity(
    opacity: opacity,
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
