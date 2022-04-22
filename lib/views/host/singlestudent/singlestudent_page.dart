import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/model/datamodel/singlestudent_model.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/invoicepayment/invoice_payment_page.dart';
import '../../../constants/constants.dart';

class SingleStudentPage extends StatefulWidget {
  SingleStudentModel singleStudentModel;

  SingleStudentPage({Key? key, required this.singleStudentModel}) : super(key: key);

  @override
  State<SingleStudentPage> createState() => _SingleStudentPageState();
}

class _SingleStudentPageState extends State<SingleStudentPage> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350.h,
            child: Stack(
              children: [
                Container(
                  height: 210.h,
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
                                  // Text(myProfile,style: PayNestTheme.title20white,),
                                ],
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(right: 25.h),
                              //   child: Container(
                              //     height : 44.h,
                              //     width : 44.w,
                              //     decoration: BoxDecoration(
                              //         color: Colors.white,
                              //         borderRadius: BorderRadius.circular(12.r)
                              //     ),
                              //     child: IconButton(
                              //       onPressed: (){
                              //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfilePage()));
                              //       },
                              //       icon: Image.asset(ic_edit,width: 20.w,height: 20.h,),
                              //       // child: Text(""),
                              //     ),
                              //   ),
                              // ),
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
                              height: 223.h,
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
                                  Text(widget.singleStudentModel.student!.firstName+" "+ widget.singleStudentModel.student!.lastName,style: PayNestTheme.title18black,),
                                  Text('Grade '+widget.singleStudentModel.student!.grade,style: PayNestTheme.h2_16textGrey,),
                                  SizedBox(height: 16.h,),
                                  Image.asset(ic_schooldark,height: 30.h,width: 30.w,),
                                  Text(widget.singleStudentModel.student!.school!.name,style: PayNestTheme.title_3_16black,),
                                  Text(widget.singleStudentModel.student!.school!.address,style: PayNestTheme.h2_16textGrey,),
                                  SizedBox(height: 13.h,),

                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: CircleAvatar(
                              radius: 46.r,
                              backgroundColor: userController.userResData.value.parent!.profileImage == null ? PayNestTheme.blueAccent : PayNestTheme.blueAccent,
                              child: userController.userResData.value.parent!.profileImage == null ? CircleAvatar(
                                backgroundColor: PayNestTheme.blueAccent,
                                // backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2022/02/19/15/05/dark-7022879_960_720.jpg'),
                                // NetworkImage(userController.userResData.value.parent!.profileImage),
                                radius: 45.r,
                                child: Text(widget.singleStudentModel.student!.firstName[0].capitalize.toString()+" "+ widget.singleStudentModel.student!.lastName[0].capitalize.toString()
                                    ,style: PayNestTheme.title20white ),
                              ):CircleAvatar(
                                backgroundImage: NetworkImage(userController.userResData.value.parent!.profileImage),
                                radius: 45.r,
                                // child: Text(widget.singleStudentModel.student!.firstName[0].capitalize.toString()+" "+ widget.singleStudentModel.student!.lastName[0].capitalize.toString()
                                //     ,style: PayNestTheme.title20white ),
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
                    Text(paymentCategories,style: PayNestTheme.title_2_16primaryColor,),
                    SizedBox(height: 15.h,),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoicePaymentPage(singleStudentModel: widget.singleStudentModel)));
                      },
                      title:Text(feepayment,style: PayNestTheme.title_3_16black),
                      subtitle:Text(payment,style: PayNestTheme.floating_12primaryColor),
                      trailing:SvgPicture.asset(arrowNext),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        side: BorderSide(
                          width: 1.w,
                          color: PayNestTheme.borderGrey,
                        )
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
