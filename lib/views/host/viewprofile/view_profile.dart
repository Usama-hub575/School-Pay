import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/changepassword/change_password.dart';
import 'package:paynest_flutter_app/views/host/editprofile/edit_profile.dart';

import '../../../constants/constants.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  final UserController userController = Get.find<UserController>();

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
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.h,top:25.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 25.w),
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
                                        icon: Icon(Icons.arrow_back,size: 20.sp,color: PayNestTheme.blueAccent),
                                        // child: Text(""),
                                      ),
                                    ),
                                  ),
                                  Text(myProfile,style: PayNestTheme.title20white,),
                                ],
                              ),
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
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfilePage()));
                                    },
                                    icon: Image.asset(ic_edit,width: 20.w,height: 20.h,),
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
                Positioned.fill(
                    top: 90,
                    child: Obx(()=>SizedBox(
                      width: 1.sw,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25.w,right: 25.w,top: 30.h),
                            child: Container(
                              // padding: EdgeInsets.symmetric(horizontal: 20.w),
                              width: 1.sw,
                              height: 112.h,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: PayNestTheme.dropShadow.withOpacity(.3),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: Offset(0, 5), // changes position of shadow
                                  ),
                                ],
                                color: PayNestTheme.colorWhite,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(userController.userResData.value.parent!.firstName + " "+ userController.userResData.value.parent!.lastName,style: PayNestTheme.title18black,),
                                  SizedBox(height: 16.h,)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: CircleAvatar(
                              radius: 46.r,
                              backgroundColor: PayNestTheme.blueAccent,
                              child: CircleAvatar(
                                backgroundImage: userController.userResData.value.parent!.profileImage == null ?
                                  NetworkImage('https://cdn.pixabay.com/photo/2022/02/19/15/05/dark-7022879_960_720.jpg'):
                                  NetworkImage(userController.userResData.value.parent!.profileImage),
                                radius: 45.r,
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 34.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(accountDetails,style: PayNestTheme.title_2_16primaryColor,),
                    SizedBox(height: 15.h,),

                    Text(name,style: PayNestTheme.h2_14textGrey,),
                    SizedBox(height: 5.h,),

                    Obx(()=>Text(userController.userResData.value.parent!.firstName + " "+ userController.userResData.value.parent!.lastName,style: PayNestTheme.title_3_16black)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Text(email,style: PayNestTheme.h2_14textGrey,),
                    SizedBox(height: 5.h,),

                    Obx(()=>Text(userController.userResData.value.parent!.email,style: PayNestTheme.title_3_16black)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    Text(contactNumber,style: PayNestTheme.h2_14textGrey,),
                    SizedBox(height: 5.h,),
                    Obx(()=>Text(userController.userResData.value.parent!.phone,style: PayNestTheme.title_3_16black,)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.all(0),
                      title: Text(pin,style: PayNestTheme.h2_14textGrey,),
                      subtitle: userController.userResData.value.parent!.pin == null ? Text("Add 4 digit Pin",style: PayNestTheme.title_3_16black,) : RoundedDot(),
                      // trailing: Container(
                      //     height: 26.h,
                      //     width: 110.w,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(4.r),
                      //         color: PayNestTheme.blueAccent
                      //     ),
                      //     child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //         primary: PayNestTheme.blueAccent,
                      //       ),
                      //       onPressed: () {
                      //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePIN()));
                      //       },
                      //       child: Center(child: FittedBox(child: Text(chgpin))),
                      //     )
                      //
                      // ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Container(
                        width: 1.sw,
                        height: 1.h,
                        color: PayNestTheme.lineColor,
                      ),
                    ),

                    SizedBox(height: 15.h,),
                    Text(passwordDetails,style: PayNestTheme.title_2_16primaryColor,),
                    SizedBox(height: 15.h,),

                    ListTile(
                      // dense: true,
                      contentPadding: EdgeInsets.all(0),
                      title: Text(password,style: PayNestTheme.h2_14textGrey,),
                      subtitle: RoundedDots(),
                      trailing: Container(
                        height: 26.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: PayNestTheme.blueAccent
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PayNestTheme.blueAccent,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePassword()));
                          },
                          child: Center(child: FittedBox(child: Text(chgPassword))),
                        )

                      ),
                    ),

                    SizedBox(height: 51.h,),
                    SizedBox(
                      height: 60.h,
                      width: 326.w,
                      child: OutlinedButton.icon(
                        onPressed: (){},
                        icon: Icon(Icons.restore_from_trash),
                        label: Text(deleteAcc,style: PayNestTheme.floating_14primaryColor,),
                        style: OutlinedButton.styleFrom(
                          // primary: MyTheme.sharpGreen,
                          elevation: 0,
                          side: BorderSide(width:1, color:PayNestTheme.blueAccent),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),

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

class RoundedDots extends StatelessWidget {
  const RoundedDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),
        SizedBox(width: 4.w,),
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),
        SizedBox(width: 4.w,),
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),
        SizedBox(width: 4.w,),
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),
        SizedBox(width: 4.w,),
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),
        SizedBox(width: 4.w,),
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),
      ],
    );
  }
}
class RoundedDot extends StatelessWidget {
  const RoundedDot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),
        SizedBox(width: 4.w,),
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),
        SizedBox(width: 4.w,),
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),
        SizedBox(width: 4.w,),
        Container(
          width: 10.h,
          height: 10.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PayNestTheme.black
          ),
        ),

      ],
    );
  }
}

