import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';
import 'package:pinput/pinput.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 44.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BlueBackButton(context: context,),
                SizedBox(width: 20.w,),
                Text(register,style: PayNestTheme.title20primaryColor),
                Spacer(),
                GestureDetector(
                  child: Text(skip,style: PayNestTheme.h2_14blueAccent,),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 23.h,bottom: 6.h),
              child: Text(createPIN,style: PayNestTheme.title22black,),
            ),
            Text(thePINwill,style: PayNestTheme.h2_14textGrey,),
            SizedBox(height: 48.h,),
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
                  Navigator.pushNamed(context, '/DashboardPage');
                },
                child: Text(create,style: PayNestTheme.subtitle16white,),
                // label:
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
    textStyle: TextStyle(fontSize: 20.sp, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xff8C8C8C)),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
