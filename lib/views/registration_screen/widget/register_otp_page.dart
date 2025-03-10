import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/widgets/inkwell_widget.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/constants.dart';
import '../../../controller/sendOTP_controller.dart';
import '../../../controller/verifyOTP_controller.dart';
import '../../../presentation/res/res.dart';
import '../../../theme/theme.dart';
import '../../../widgets/spacer.dart';
import '../../../widgets/toast.dart';

class RegisterOtpPage extends StatefulWidget {
  const RegisterOtpPage({
    Key? key,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.phoneCode,
    required this.onSuccess,
  }) : super(key: key);

  final String phoneCode;
  final String phoneNumber;
  final String email;
  final String password;
  final Function onSuccess;

  @override
  State<RegisterOtpPage> createState() => _RegisterOtpPageState();
}

class _RegisterOtpPageState extends State<RegisterOtpPage> {
  bool loading = false;
  bool completeCode = false;
  TextEditingController otpController = TextEditingController();
  SendOTPController sendOTPController = Get.put(SendOTPController());
  VerifyOTPController verifyOTPController = Get.put(VerifyOTPController());
  int _start = 60;
  bool timeUpFlag = false;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalValue(16),
        ),
        child: Column(
          children: [
            verticalSpacer(16),
            Text(
              confirmCode,
              style: PayNestTheme.h2_14textGrey.copyWith(
                color: PayNestTheme.black,
                fontSize: sizes.fontRatio * 18,
                fontFamily: 'montserratExtraBold',
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpacer(16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(12),
                      ),
                      child: Text(
                        'The Code Has Been sent to ${widget.phoneCode + widget.phoneNumber} & ${widget.email}. Please Enter The Code Below.',
                        style: PayNestTheme.h2_14textGrey.copyWith(
                          fontFamily: "montserratRegular",
                          fontSize: sizes.fontRatio * 12,
                        ),
                      ),
                    ),
                    verticalSpacer(80),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalValue(16),
                      ),
                      child: Pinput(
                        length: 4,
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
                        controller: otpController,
                        validator: (s) {
                          if (s!.length < 4) {
                            setState(() {
                              completeCode = false;
                            });
                          }
                          return s.isEmpty ? "Enter Code" : '';
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        keyboardType: TextInputType.phone,
                        showCursor: true,
                        onCompleted: (pin) {
                          setState(
                            () {
                              completeCode = true;
                            },
                          );
                        },
                      ),
                    ),
                    verticalSpacer(50),
                    !timeUpFlag
                        ? Text("Try it after $_start seconds")
                        : InkWellWidget(
                            onTap: () => startTimer(),
                            child: Text(
                              resend,
                              style: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 16,
                                color: PayNestTheme.primaryColor,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Obx(
              () => TextButton(
                style: TextButton.styleFrom(
                    backgroundColor:
                        completeCode ? PayNestTheme.primaryColor : Colors.grey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: verticalValue(16),
                    )),
                onPressed: () async {
                  if (otpController.length == 4) {
                    await verifyOTPController.hitVerifyOTP(
                        widget.phoneCode + widget.phoneNumber,
                        otpController.text);
                    if (verifyOTPController.isSuccess.value) {
                      verifyOTPController.otpVerifyData.update((val) {
                        val!.type = null;
                      });
                      otpController.clear();
                      setState(() {
                        completeCode = false;
                      });
                      widget.onSuccess();
                    } else {
                      showToast(
                          message: 'Entered OTP is wrong',
                          context: context,
                          color: PayNestTheme.red);
                      // otpController.clear();
                    }
                  }
                },
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      next,
                      style: PayNestTheme.subtitle16white
                          .copyWith(fontSize: sizes.fontRatio * 14),
                    ),
                    const Spacer(),
                    !verifyOTPController.isLoading.value
                        ? const SizedBox.shrink()
                        : Container(
                            height: sizes.heightRatio * 16,
                            width: sizes.widthRatio * 16,
                            child: CircularProgressIndicator(
                              backgroundColor: PayNestTheme.colorWhite,
                              color: PayNestTheme.primaryColor,
                              strokeWidth: 2,
                            ),
                          ),
                    horizontalSpacer(16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(
        fontSize: 20.sp,
        color: const Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xff8C8C8C)),
      borderRadius: BorderRadius.circular(12.r),
    ),
  );

  void startTimer() {
    sendOTPController.hitSendOTP(
        widget.phoneCode, widget.phoneNumber, widget.email);
    setState(() {
      timeUpFlag = false;
      _start = 60;
    });
    const oneSec = Duration(seconds: 1);

    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start < 2) {
          setState(() {
            timeUpFlag = true;
            timer.cancel();
          });
        } else {
          if (mounted) {
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }
}
