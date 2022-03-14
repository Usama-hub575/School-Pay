import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

class PendingTask extends StatefulWidget {
  const PendingTask({Key? key}) : super(key: key);

  @override
  State<PendingTask> createState() => _PendingTaskState();
}

class _PendingTaskState extends State<PendingTask> {
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
                              icon: Icon(Icons.clear,size: 20.sp,color: PayNestTheme.blueAccent),
                              // child: Text(""),
                            ),
                          ),
                        ),
                        Text(pendingTask,style: PayNestTheme.title20white,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
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

                  title: Text(setPIN,style: PayNestTheme.title_3_16black,),
                  trailing:SvgPicture.asset(arrowNext),
                  subtitle: Text(youneedtosetuppin,style: PayNestTheme.small_2_12textGrey,),
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
