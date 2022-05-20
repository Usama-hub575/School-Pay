import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:paynest_flutter_app/widgets/blue_back_button.dart';

class DetailsPage extends StatefulWidget {
  var phoneCode;
  var phoneNumber;
  var email;
  var password;

  DetailsPage({Key? key, required this.phoneCode, required this.phoneNumber,required this.email,required this.password}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool loading = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emirateIDController = TextEditingController();
  TextEditingController expiryController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  UserController registerController = Get.put(UserController());


  @override
  Widget build(BuildContext context) {
    setState(() {
      phoneController.text = widget.phoneCode+widget.phoneNumber;
      emailController.text = widget.email;
    });
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
                  Form(
                    key: Utils.registrationFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(personalInformation,style: PayNestTheme.title_2_16primaryColor,),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: phoneController,
                          enabled: false,
                          decoration: InputDecoration(
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
                          controller: emailController,
                          enabled: false,
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
                          controller: fnameController,
                          decoration: InputDecoration(
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
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if (value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 13.h,),
                        TextFormField(
                          controller: lnameController,
                          decoration: InputDecoration(
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
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if (value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 13.h,),
                        TextFormField(
                          controller: emirateIDController,
                          decoration: InputDecoration(
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
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if (value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 13.h,),
                        TextFormField(
                          controller: expiryController,
                          decoration: InputDecoration(
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
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24.h,),

                        Text(addressDetails,style: PayNestTheme.title_2_16primaryColor,),
                        SizedBox(height: 15.h,),

                        TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(
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
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 13.h,),
                        TextFormField(
                          controller: areaController,
                          decoration: InputDecoration(
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
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 13.h,),
                        TextFormField(
                          controller: countryController,
                          decoration: InputDecoration(
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
                          autovalidateMode:AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(value!.trim().isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24.h,),
                      ],
                    ),
                  ),
                  Obx(()=>SizedBox(
                    height: 60.h,
                    width: 326.w,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:PayNestTheme.blueAccent,
                        elevation: 0,
                        // side: BorderSide(width:1, color:Colors.white),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () async {
                        if(Utils.registrationFormKey.currentState!.validate()){
                          /// Hit Register API via Controller
                          await registerController.hitRegister(
                              emailController.text,
                              phoneController.text,
                              widget.password,
                              fnameController.text,
                              lnameController.text,
                              widget.phoneCode,
                              countryController.text,
                              emirateIDController.text,
                              areaController.text,
                              countryController.text,
                              addressController.text
                          );
                          if(registerController.userResData.value.status == true){
                            Navigator.pushNamed(context, '/CreatePin');
                          }else if(registerController.userResData.value.status == true){
                            print("");
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(registerController.isFailed.toString())));
                            print(registerController.isFailed);
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(next,style: PayNestTheme.subtitle16white,),
                          !registerController.isLoading.value ? Icon(Icons.play_circle_fill,color: PayNestTheme.colorWhite,):
                          SizedBox(
                            height: 10.sp,
                            width: 10.sp,
                            child: CircularProgressIndicator(backgroundColor: PayNestTheme.colorWhite,),
                          ),
                        ],
                      ),
                      // label:
                    ),
                  )),
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
