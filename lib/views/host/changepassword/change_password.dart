import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                               icon: Icon(Icons.arrow_back,size: 20.sp),
                               // child: Text(""),
                             ),
                           ),
                         ),
                         Text(chgPassword),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),

           Padding(
             padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 25.h),
             child: Column(
               children: [
                 Padding(
                   padding: EdgeInsets.only(bottom: 17.h),
                   child: TextFormField(
                     decoration: InputDecoration(
                       // contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                           borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                       labelText: oldPassword,
                       // labelStyle: CustomizedTheme.b_W400_12,
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                         borderSide: BorderSide(color: Colors.black),
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(bottom: 17.h),
                   child: TextFormField(
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
                 ),
                 Padding(
                   padding: EdgeInsets.only(bottom: 17.h),
                   child: TextFormField(
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
                 ),
               ],
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
           SizedBox(height: 15.h,),
         ],
       ),
    );
  }
}
