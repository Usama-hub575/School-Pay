import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/theme/theme.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                                  Text(editProfile,style: PayNestTheme.title20white,),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 25.h),
                                child: SizedBox(
                                  height : 44.h,
                                  width : 80.w,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: PayNestTheme.colorWhite,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.r)
                                      )
                                    ),
                                    onPressed: (){},
                                    child: Text(save,style: PayNestTheme.h2_14blueAccent,),
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
                    child: SizedBox(
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
                                    color: PayNestTheme.dropShadow,
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                                color: PayNestTheme.colorWhite,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Belal Syed",style: PayNestTheme.title18black,),
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
                                backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2022/02/19/15/05/dark-7022879_960_720.jpg'),
                                radius: 45.r,
                              ),
                            ),
                          )
                        ],
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
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.h,bottom: 16.h),
                      child: Text(personalDetails,style: PayNestTheme.title_2_16primaryColor,),
                    ),
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
                          labelText: newPassword,
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
                          labelText: confirmpassword,
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
            )
          )

        ],
      ),
    );
  }
}
