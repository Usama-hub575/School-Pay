import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BlueBackButton(context: context,),
                  SizedBox(width: 20.w,),
                  Text(signIn),
                ],
              ),
              SizedBox(height: 58.h,),
              TextFormField(
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                      borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                  labelText: email,
                  // labelStyle: CustomizedTheme.b_W400_12,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 13.h,),
              TextFormField(
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                      borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                  labelText: password,
                  // labelStyle: CustomizedTheme.b_W400_12,
                  suffixText: show,
                  // suffixStyle: ,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h,bottom: 72.h),
                child: Text(forgotpassword),
              ),
              InkWell(
                child: Center(
                    child: Image.asset(touchid)
                )),
              SizedBox(height: 47.h,),

              SizedBox(
                height: 60.h,
                width: 326.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: MyTheme.sharpGreen,
                      elevation: 0,
                      // side: BorderSide(width:1, color:Colors.white),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/DashboardPage');
                    },
                    child: Text(signIn,style: PayNestTheme.subtitle16white)
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  children: [
                    Container(
                      height: 1.h,
                      width: 129.w,
                      decoration: BoxDecoration(
                        color: Color(0xffE4E6EC),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(or),
                    ),
                    Container(
                      height: 1.h,
                      width: 129.w,
                      decoration: BoxDecoration(
                        color: Color(0xffE4E6EC),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
                width: 326.w,
                child: OutlinedButton.icon(
                  onPressed: (){},
                  icon: Image.asset(googleicon),
                  label: Text(google),
                  style: OutlinedButton.styleFrom(
                    // primary: MyTheme.sharpGreen,
                    elevation: 0,
                    // side: BorderSide(width:1, color:Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              SizedBox(height: 16.h,),

              SizedBox(
                height: 60.h,
                width: 326.w,
                child: OutlinedButton.icon(
                  onPressed: (){},
                  icon: Image.asset(facebookicon),
                  label: Text(facebook),
                  style: OutlinedButton.styleFrom(
                    // primary: MyTheme.sharpGreen,
                    elevation: 0,
                    // side: BorderSide(width:1, color:Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
