import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool loading = false;
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
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 23.h,bottom: 38.h),
              child: Text(pleaseenterdetailbelow,style: PayNestTheme.title22black,),
            ),


            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Text(personalInformation,style: PayNestTheme.title_2_16primaryColor,),
                  SizedBox(height: 15.h,),
                  TextFormField(
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                      labelText: phone,
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
                      labelText: fname,
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
                      labelText: lname,
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
                      labelText: emiratesID,
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
                      labelText: expiry,
                      // labelStyle: CustomizedTheme.b_W400_12,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h,),

                  Text(addressDetails,style: PayNestTheme.title_2_16primaryColor,),
                  SizedBox(height: 15.h,),

                  TextFormField(
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                      labelText: address,
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
                      labelText: area,
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
                      labelText: country,
                      // labelStyle: CustomizedTheme.b_W400_12,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h,),

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
                        setState(() {
                          loading = true;
                        });
                        Future.delayed(
                            Duration(seconds: 3),(){
                          setState(() {
                            loading = false;
                          });
                          Navigator.pushNamed(context, '/CreatePin');
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
                  SizedBox(height: 24.h,),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
