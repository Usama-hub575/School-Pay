import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/changepin/change_pin.dart';
import 'package:paynest_flutter_app/views/host/transaction/recent_transaction_page.dart';
import 'package:paynest_flutter_app/views/host/viewprofile/view_profile.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 240.h,
            child: Stack(
              children: [
                Container(
                  height: 172.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: PayNestTheme.primaryColor,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r))
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(paynest,style: PayNestTheme.title20white,),
                        Text(PSMore,style: PayNestTheme.small_2_12white,),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 130,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      width: 347.h,
                      height: 99.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: PayNestTheme.dropShadow,
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        color: PayNestTheme.colorWhite,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(dp),
                              ),
                              SizedBox(width: 5.w,),
                              Text("Belal",style: PayNestTheme.title18black,),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewProfile()));
                            },
                            child: Row(
                              children: [
                                Text(viewprofile,style: PayNestTheme.h2_12blueAccent,),
                                Icon(Icons.arrow_forward_ios,size: 15.sp,color: PayNestTheme.blueAccent),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 32.h,bottom: 22.h),
                      child: Text(payments,style: PayNestTheme.title_2_16primaryColor,),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecentTrasactionPage()));
                      },
                      leading:SvgPicture.asset(ic_paymentHistory),
                      title: Text(paymentHistory,style: PayNestTheme.title_3_16black,),
                      trailing:SvgPicture.asset(arrowNext),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 32.h,bottom: 22.h),
                      child: Text(setting,style: PayNestTheme.title_2_16primaryColor),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePIN()));
                      },
                      leading: SvgPicture.asset(ic_changeSecurity),
                      title: Text(chgPIN,style: PayNestTheme.title_3_16black,),
                      trailing:SvgPicture.asset(arrowNext),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ic_biometric),
                      title: Text(biometricAuth,style: PayNestTheme.title_3_16black,),
                      trailing:CupertinoSwitch(
                        onChanged: (value){},
                        value: false,
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ic_location),
                      title: Text(Location,style: PayNestTheme.title_3_16black,),
                      trailing:CupertinoSwitch(
                        onChanged: (value){},
                        value: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.h,bottom: 22.h),
                      child: Text(about,style: PayNestTheme.title_2_16primaryColor),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(faq),
                      title: Text(FAQ,style: PayNestTheme.title_3_16black,),
                      trailing:SvgPicture.asset(arrowNext),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ic_contactUs),
                      title: Text(contactUs,style: PayNestTheme.title_3_16black,),
                      trailing:SvgPicture.asset(arrowNext),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ic_privacyPolicy),
                      title: Text(privacyPolicy,style: PayNestTheme.title_3_16black,),
                      trailing:SvgPicture.asset(arrowNext),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ic_terms),
                      title: Text(termConditions,style: PayNestTheme.title_3_16black,),
                      trailing:SvgPicture.asset(arrowNext),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    
                    SizedBox(
                      width: 1.sw,
                      height: 60.h,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                          side: BorderSide(
                            color: Colors.red,
                            style: BorderStyle.solid,
                            width: 1.w,
                          ),
                        ),
                        onPressed: (){},
                        child: Text(signOut,style: PayNestTheme.title_3_16red,),
                      ),
                    ),
                    SizedBox(height: 40.h,),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
