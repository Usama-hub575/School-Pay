import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/updateprofile_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final UserController userController = Get.find<UserController>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UpdateProfileController updateProfileController = Get.put(UpdateProfileController());



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController(text: userController.userResData.value.parent!.email);
    firstNameController = TextEditingController(text: userController.userResData.value.parent!.firstName);
    lastNameController = TextEditingController(text: userController.userResData.value.parent!.lastName);
  }

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
                                child: Obx(()=>SizedBox(
                                  height : 44.h,
                                  width : 80.w,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: PayNestTheme.colorWhite,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.r)
                                      )
                                    ),
                                    onPressed: () async {
                                      if(Utils.editProfileFormKey.currentState!.validate()){
                                        await updateProfileController.hitUpdateProfile(
                                            userController.userResData.value.parent!.id.toString(),
                                            firstNameController.text,
                                            lastNameController.text
                                        );
                                        if(updateProfileController.updateProfileData.value.status == true){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                                              // updateProfileController.updateProfileData.value.message.toString(),
                                            "Profile Updated"
                                          ),backgroundColor: Colors.green,));
                                          userController.userResData.update((val) {
                                            val!.parent!.firstName = firstNameController.text;
                                            val.parent!.lastName = lastNameController.text;
                                          });
                                          Navigator.pop(context);
                                        }else{
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to Update'),backgroundColor: Colors.red,));
                                        }
                                      }
                                    },
                                    child: !updateProfileController.isLoading.value ? Text(save,style: PayNestTheme.h2_14blueAccent,) :Center(child: SizedBox(height: 10.h,width: 10.w,child: CircularProgressIndicator(backgroundColor: PayNestTheme.colorWhite,color: PayNestTheme.blueAccent,))),
                                  ),
                                )),
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
                                  Obx(()=>Text(userController.userResData.value.parent!.firstName + " "+ userController.userResData.value.parent!.lastName,style: PayNestTheme.title18black,)),
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
                              child: Obx(()=>CircleAvatar(
                                backgroundImage: userController.userResData.value.parent!.profileImage == null ?
                                NetworkImage('https://cdn.pixabay.com/photo/2022/02/19/15/05/dark-7022879_960_720.jpg'):
                                NetworkImage(userController.userResData.value.parent!.profileImage),
                                radius: 45.r,
                              )),
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
              child: Form(
                key: Utils.editProfileFormKey,
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
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                            labelText: firstName,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: PayNestTheme.primaryColor),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Required";
                            }else{
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 17.h),
                        child: TextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                            labelText: lastName,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: PayNestTheme.primaryColor),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Required";
                            }else{
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 17.h),
                        child: TextFormField(
                          controller: emailController,
                          enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                            labelText: email,
                            // labelStyle: CustomizedTheme.b_W400_12,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(color: PayNestTheme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          )

        ],
      ),
    );
  }
}
