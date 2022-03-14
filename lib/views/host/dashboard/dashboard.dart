import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/assistance/get_assistance.dart';
import 'package:paynest_flutter_app/views/host/changepin/change_pin.dart';
import 'package:paynest_flutter_app/views/host/notification/notification_page.dart';
import 'package:paynest_flutter_app/views/host/pendingtask/pending_task.dart';
import 'package:paynest_flutter_app/views/host/school/select_school.dart';
import 'package:paynest_flutter_app/widgets/mycarousel_slider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(welcome,style: PayNestTheme.title20white,),
                        Text("Ahmed",style: PayNestTheme.subtitle16white,),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height : 44.h,
                          width : 44.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: IconButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationPage()));
                            },
                            icon: Image.asset(ic_bell,height: 20.sp,)
                            // child: Text(""),
                          ),
                        ),
                        SizedBox(width: 12.w,),
                        Container(
                          height : 44.h,
                          width : 44.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(12.r))
                          ),
                          child: IconButton(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetAssistance()));

                            },
                            icon: SvgPicture.asset(faq,semanticsLabel: paynest,height: 20.sp),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          //header end

          CarouselSliderPage(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 23.3.h,bottom: 10.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(pendingTask,style: PayNestTheme.title_2_16primaryColor,),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PendingTask()));
                          },
                            child: Text(showAll,style: PayNestTheme.h2_12blueAccent,)),
                      ],
                    ),
                    SizedBox(height: 10.5.h),

                    SizedBox(
                      height: 48.h,
                      width: 326.w,
                      child: OutlinedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePIN()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(setPIN,style: PayNestTheme.title_3_16black,),
                            SvgPicture.asset(arrowNext,height: 20.sp,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.5.h),
                    SizedBox(
                      height: 48.h,
                      width: 326.w,
                      child: OutlinedButton(
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(makeFirstPayment,style: PayNestTheme.title_3_16black,),
                            SvgPicture.asset(arrowNext,height: 20.sp,)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.5.h,bottom: 11.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(student,style: PayNestTheme.title_2_16primaryColor,),
                          Text(showAll,style: PayNestTheme.h2_12blueAccent,),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        //if some got some students
                        InkWell(

                          child: Container(
                            height: 210.h,
                            width: 156.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: PayNestTheme.borderGrey,width: 1)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 11.h,horizontal: 10.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(ic_studentAvatar,height: 50.sp),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.21.h,bottom: 8.h),
                                        child: Text("Ali Hamdan",style: PayNestTheme.small_14black,),
                                      ),
                                      Text("Beaconhouse Al Khaleej International Pvt school",style: PayNestTheme.small_2_12textGrey,),
                                      SizedBox(height: 15.h,),
                                      Container(
                                        height: 18.h,
                                        width: 50.79.w,
                                        decoration: BoxDecoration(
                                          color: PayNestTheme.paidGreen,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(child: Text(paid,style: PayNestTheme.small_2_12white,)),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1.sw,
                                  height: 1.h,
                                  color: PayNestTheme.borderGrey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(view,style: PayNestTheme.h2_14blueAccent,),
                                    SizedBox(width: 5.w,),
                                    SvgPicture.asset(arrowNext),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        SizedBox(width: 14.w,),

                        SizedBox(
                          height: 210.h,
                          width: 156.w,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              // backgroundColor:Colors.blue,
                              elevation: 0,
                              side: BorderSide(width:1, color:PayNestTheme.borderGrey),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectSchool()));

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 32.h,
                                  width: 32.w,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8.r)
                                  ),
                                  child: IconButton(
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectSchool()));

                                    },
                                    icon: Icon(Icons.add,color: Colors.white,size: 12.sp,),
                                  ),
                                ),
                                SizedBox(height: 15.h,),
                                Text(addStudent,style: PayNestTheme.h2_14blueAccent,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                  ],
                ),
              ),
            ),
          )



        ],
      ),
    );
  }
}