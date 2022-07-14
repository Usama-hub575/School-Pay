import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynest_flutter_app/res/res.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/constants.dart';
import '../../../controller/sendOTP_controller.dart';
import '../../../controller/verifyOTP_controller.dart';
import '../../../model/datamodel/reg1_to_otp.dart';
import '../../../theme/theme.dart';
import '../../../widgets/spacer.dart';

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
      body: SizedBox(
        height: 1.sh,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 23.h, bottom: 6.h),
                child: Text(
                  confirmCode,
                  style: PayNestTheme.title22blackbold,
                ),
              ),
              Text(
                'The code has been sent to ${widget.phoneCode + widget.phoneNumber} and ${widget.email}.\n Please enter the code below.',
                style: PayNestTheme.h2_14textGrey,
              ),
              verticalSpacer(16),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                ),
                child: Pinput(
                  defaultPinTheme: PinTheme(
                    textStyle: PayNestTheme.h2_12blueAccent.copyWith(
                      fontSize: sizes.fontRatio*16,
                      color: PayNestTheme.black,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PayNestTheme.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    width: sizes.widthRatio*80,
                    height: sizes.heightRatio*50,
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
              verticalSpacer(32),
              !timeUpFlag
                  ? Text("Try it after $_start seconds")
                  : GestureDetector(
                      onTap: () => startTimer(),
                      child: Text(
                        resend,
                        style: PayNestTheme.h2_12blueAccent.copyWith(
                          fontSize: sizes.fontRatio*14,
                          color: PayNestTheme.primaryColor,
                        ),
                      )),
              Spacer(),
              Obx(
                () => Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: PayNestTheme.primaryColor,
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
                    onPressed: () async {
                      if (otpController.length == 4) {
                        await verifyOTPController.hitVerifyOTP(
                            widget.phoneCode + widget.phoneNumber,
                            otpController.text);
                        if (verifyOTPController.isSuccess.value) {
                          () => widget.onSuccess();
                          verifyOTPController.otpVerifyData.update((val) {
                            val!.type = null;
                          });
                          otpController.clear();
                          setState(
                            () {
                              completeCode = false;
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Entered OTP is wrong'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          // otpController.clear();
                        }
                      }
                    },
                    child: Center(
                      child: Text(
                        next,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: PayNestTheme.colorWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(
        fontSize: 20.sp,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xff8C8C8C)),
      borderRadius: BorderRadius.circular(12.r),
    ),
  );

  void startTimer() {
    sendOTPController.hitSendOTP(widget.phoneCode + widget.phoneNumber);
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
