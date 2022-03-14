import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool loading = false;
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
                  child: Text(confirmCode,style: PayNestTheme.title22black,),
                ),
                Text('The code has been sent to +9715212345 and abc@xyzmail.com.\n Please enter the code below.',style: PayNestTheme.h2_14textGrey,),
                Padding(
                  padding: EdgeInsets.only(top: 48.h,bottom: 36.h),
                  child: Pinput(
                    defaultPinTheme: defaultPinTheme,
                    // focusedPinTheme: focusedPinTheme,
                    // submittedPinTheme: submittedPinTheme,

                    validator: (s) {
                      return s == '2222' ? null : 'Pin is incorrect';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                ),
                !timeUpFlag ? Text("Try it after $_start seconds"):GestureDetector(
                  onTap:() =>startTimer(),
                    child: Text(resend,style: PayNestTheme.h2_12blueAccent,)
                ),

                Spacer(),
                SizedBox(
                  height: 60.h,
                  width: 326.w,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:PayNestTheme.blueAccent,
                      elevation: 0,
                      // side: BorderSide(width:1, color:Colors.white),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: (){
                      setState(() {
                        loading = true;
                      });
                      Future.delayed(
                          Duration(seconds: 3),(){
                        setState(() {
                          loading = false;
                        });
                        Navigator.pushNamed(context, '/DetailsPage');
                      }
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(next,style: PayNestTheme.subtitle16white,),
                        !loading ? Icon(Icons.play_circle_fill,color: Colors.white,):
                        SizedBox(
                          height: 10.sp,
                          width: 10.sp,
                          child: CircularProgressIndicator(backgroundColor: Colors.white,),
                        ),
                      ],
                    ),
                    // label:
                  ),
                ),
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
      borderRadius: BorderRadius.circular(20),
    ),
  );

  // Timer _timer;
  int _start = 10;
  bool timeUpFlag = false;

  void startTimer() {
    setState(() {
      timeUpFlag = false;
      _start = 10;
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
