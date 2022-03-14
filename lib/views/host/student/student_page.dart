import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/school/select_school.dart';
import 'package:paynest_flutter_app/views/host/transaction/recent_transaction_page.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(student,style: PayNestTheme.title20white,),
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectSchool()));

                              },
                              icon: Icon(Icons.add,size: 20.sp,color: PayNestTheme.blueAccent,),
                              // child: Text(""),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Text(noStudent),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 16.h,),

                Container(
                  height: 28.w,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: PayNestTheme.lineColor
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("School of Excellence",style: PayNestTheme.small_2_12textGrey,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h,),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          width: 1.w,
                          color: PayNestTheme.lineColor
                      )
                  ),
                  onTap: (){
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecentTrasactionPage()));
                  },
                  leading:CircleAvatar(
                    radius: 25.r,
                  ),
                  title: Text(paymentHistory,style: PayNestTheme.title_3_16black,),
                  trailing:SvgPicture.asset(arrowNext),
                  subtitle: Text("School of Excellence",style: PayNestTheme.h2_14textGrey,),
                ),
                SizedBox(height: 16.h,),

              ],
            ),
          )
        ],
      ),
    );
  }
}
