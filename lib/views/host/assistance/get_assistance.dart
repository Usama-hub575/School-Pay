import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

class GetAssistance extends StatefulWidget {
  const GetAssistance({Key? key}) : super(key: key);

  @override
  State<GetAssistance> createState() => _GetAssistanceState();
}

class _GetAssistanceState extends State<GetAssistance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 246.h,
            decoration: BoxDecoration(
                color: PayNestTheme.primaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r))
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 25.w,right: 25.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 25.h,top: 15.h),
                      child: Container(
                        height : 44.h,
                        width : 44.w,
                        decoration: BoxDecoration(
                            color: PayNestTheme.colorWhite,
                            borderRadius: BorderRadius.circular(12.r)
                        ),
                        child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back,size: 20.sp,color: PayNestTheme.blueAccent),
                          // child: Text(""),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 34.h,bottom: 11.h,left: 7.w,right:7.w),
                      child: Text(assistance,style: PayNestTheme.title20white,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.w,right:7.w),
                      child: Text(assistanceMSG,style: PayNestTheme.small_2_14colorWhite,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
            child: Row(
              children: [
                Container(
                  height: 200.h,
                  width: 167.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(width: 1.w,color: PayNestTheme.lineColor)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 55.h,
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: PayNestTheme.blueAccent,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(appTutorial,style: PayNestTheme.title_3_18colorWhite,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
                        child: Text(appGUIDE,style: PayNestTheme.small_2_12black),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                            child: SvgPicture.asset(arrowNext),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.w,),
                Container(
                  height: 200.h,
                  width: 167.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(width: 1.w,color: PayNestTheme.lineColor)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 55.h,
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: PayNestTheme.blueAccent,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contactCC,style: PayNestTheme.title_3_18colorWhite),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
                        child: Text(contactAssistance,style: PayNestTheme.small_2_12black,),
                      ),
                      Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                            child: SvgPicture.asset(arrowNext),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //2nd row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
            child: Row(
              children: [
                Container(
                  height: 200.h,
                  width: 167.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(width: 1.w,color: PayNestTheme.lineColor)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 55.h,
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                            color: PayNestTheme.blueAccent,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(FAQs,style: PayNestTheme.title_3_18colorWhite),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
                        child: Text(commonQuestion,style: PayNestTheme.small_2_12black),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                            child: SvgPicture.asset(arrowNext),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.w,),
                Container(
                  height: 200.h,
                  width: 167.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(width: 1.w,color: PayNestTheme.lineColor)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 55.h,
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                            color: PayNestTheme.blueAccent,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(liveChat,style: PayNestTheme.title_3_18colorWhite),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
                        child: Text(startLChat,style: PayNestTheme.small_2_12black),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                            child: SvgPicture.asset(arrowNext),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
