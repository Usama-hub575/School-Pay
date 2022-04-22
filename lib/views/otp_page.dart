import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/sendOTP_controller.dart';
import 'package:paynest_flutter_app/controller/verifyOTP_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/reg1_to_otp.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  var phoneCode;
  var phoneNumber;
  var email;
  var password;

  OTPPage({Key? key, required this.phoneCode, required this.phoneNumber,required this.email,required this.password}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool loading = false;
  bool completeCode = false;
  TextEditingController otpController = TextEditingController();

  //when activity opens this calls to send otp
  SendOTPController sendOTPController = Get.put(SendOTPController());
  //after otp it is called to verify otp
  VerifyOTPController verifyOTPController = Get.put(VerifyOTPController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      startTimer();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1.sh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 44.h),
            child: Column(
              children: [
                Row(
                  children: [
                    BlueBackButton(context: context,),
                    SizedBox(width: 20.w,),
                    Text(register,style: PayNestTheme.title20primaryColor),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 23.h,bottom: 6.h),
                  child: Text(confirmCode,style: PayNestTheme.title22blackbold,),
                ),
                Text('The code has been sent to ${widget.phoneCode+widget.phoneNumber} and ${widget.email}.\n Please enter the code below.',style: PayNestTheme.h2_14textGrey,),
                Padding(
                  padding: EdgeInsets.only(top: 48.h,bottom: 36.h),
                  child: Pinput(
                    defaultPinTheme: defaultPinTheme,
                    controller: otpController,
                    // focusedPinTheme: focusedPinTheme,
                    // submittedPinTheme: submittedPinTheme,

                    validator: (s) {
                      if(s!.length < 4){
                        setState(() {
                          completeCode = false;
                        });
                      }
                      return s.isEmpty ? "Enter Code" : '';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) {
                      setState(() {
                        completeCode = true;
                      });
                    },
                  ),
                ),
                !timeUpFlag ? Text("Try it after $_start seconds"):GestureDetector(
                  onTap:() =>startTimer(),
                    child: Text(resend,style: PayNestTheme.h2_12blueAccent,)
                ),

                Spacer(),
                Obx(()=>SizedBox(
                  height: 60.h,
                  width: 326.w,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:completeCode ? PayNestTheme.blueAccent :Colors.grey,
                      elevation: 0,
                      // side: BorderSide(width:1, color:Colors.white),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      if(otpController.length == 4){
                        await verifyOTPController.hitVerifyOTP(widget.phoneCode+widget.phoneNumber, otpController.text);
                        if(verifyOTPController.isSuccess.value){
                           Navigator.pushNamed(context, '/DetailsPage',arguments: Reg1toOtp(
                               phoneCode: widget.phoneCode,
                               phoneNumber: widget.phoneNumber,
                               email: widget.email,
                               password: widget.password
                           ));
                           verifyOTPController.otpVerifyData.update((val) {
                             val!.type = null;
                           });
                           otpController.clear();
                           setState(() {
                             completeCode = false;
                           });
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Entered OTP is wrong'),backgroundColor: Colors.red,));
                          // otpController.clear();
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(next,style: PayNestTheme.subtitle16white,),
                        !verifyOTPController.isLoading.value ? Icon(Icons.play_circle_fill,color: Colors.white,):
                        SizedBox(
                          height: 10.sp,
                          width: 10.sp,
                          child: CircularProgressIndicator(backgroundColor: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );

  }
  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 70.h,
    textStyle: TextStyle(fontSize: 20.sp, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xff8C8C8C)),
      borderRadius: BorderRadius.circular(12.r),
    ),
  );

  // Timer _timer;
  int _start = 60;
  bool timeUpFlag = false;

  void startTimer() {
    sendOTPController.hitSendOTP(widget.phoneCode+widget.phoneNumber);
    setState(() {
      timeUpFlag = false;
      _start = 60;
    });
    const oneSec = Duration(seconds: 1);

     Timer.periodic(
      oneSec,(Timer timer) {
        if (_start < 2) {
          setState(() {
            timeUpFlag = true;
            timer.cancel();
          });
        } else {
          if(mounted){
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }
}
