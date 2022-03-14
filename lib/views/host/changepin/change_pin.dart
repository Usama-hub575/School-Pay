import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:pinput/pinput.dart';

class ChangePIN extends StatefulWidget {
  const ChangePIN({Key? key}) : super(key: key);

  @override
  State<ChangePIN> createState() => _ChangePINState();
}

class _ChangePINState extends State<ChangePIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 129.h,
            decoration: BoxDecoration(
                color: PayNestTheme.primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r))
            ),
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
                            height : 44.h,
                            width : 44.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r)
                            ),
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.clear,size: 20.sp),
                              // child: Text(""),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(chgPIN,style: PayNestTheme.title20white,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Text(enterPin),
          Center(
            child: Padding(
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
          ),
          Spacer(),
          SizedBox(
            height: 60.h,
            width: 326.w,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:Colors.blue,
                elevation: 0,
                // side: BorderSide(width:1, color:Colors.white),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: (){
                // Navigator.pushNamed(context, '/DashboardPage');
              },
              child: Text(create,style: PayNestTheme.subtitle16white,),
              // label:
            ),
          ),
          SizedBox(height: 50.h,),
        ],
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
}
