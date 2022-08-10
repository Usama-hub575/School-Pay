import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/updateprofile_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:paynest_flutter_app/widgets/emirates_id_add_dash_function.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../res/res.dart';
import '../../../widgets/editing_text_emirates_id_formater.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final UserController userController = Get.find<UserController>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emiratesIdController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(
      text: userController.userResData.value.parent!.email,
    );
    firstNameController = TextEditingController(
      text: userController.userResData.value.parent!.firstName +
          ' ' +
          userController.userResData.value.parent!.lastName,
    );
    phoneNumberController = TextEditingController(
      text: userController.userResData.value.parent!.dialCode +
          userController.userResData.value.parent!.phone,
    );
    emiratesIdController = TextEditingController(
      text: userController.userResData.value.parent!.emiratesId.length >= 14
          ? getDashedEmiratesId(
              userController.userResData.value.parent!.emiratesId)
          : userController.userResData.value.parent!.emiratesId,
    );
    expiryDateController = TextEditingController(
      text: userController.userResData.value.parent!.expiryDate != null ||
              userController.userResData.value.parent!.expiryDate
                  .toString()
                  .isEmpty
          ? '-'
          : userController.userResData.value.parent!.expiryDate,
    );
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
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        24.r,
                      ),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 25.h,
                        top: 25.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 25.w),
                                child: Container(
                                  height: 44.h,
                                  width: 44.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      12.r,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      size: 20.sp,
                                      color: PayNestTheme.primaryColor,
                                    ),
                                    // child: Text(""),
                                  ),
                                ),
                              ),
                              horizontalSpacer(50),
                              Text(
                                editProfile,
                                style: PayNestTheme.title20white.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'montserratBold',
                                    fontSize: sizes.fontRatio * 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: verticalValue(100),
                  child: Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: horizontalValue(24),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                              top: 30.h,
                            ),
                            child: Container(
                              width: 1.sw,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: PayNestTheme.dropShadow.withOpacity(
                                      .3,
                                    ),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: Offset(
                                      0,
                                      5,
                                    ),
                                  ),
                                ],
                                color: PayNestTheme.colorWhite,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    userController.userResData.value.parent!
                                            .firstName +
                                        " " +
                                        userController
                                            .userResData.value.parent!.lastName,
                                    style: PayNestTheme.title18black.copyWith(
                                      fontSize: sizes.fontRatio * 18,
                                      fontFamily: 'montserratBold',
                                    ),
                                  ),
                                  verticalSpacer(16),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(46),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2022/02/19/15/05/dark-7022879_960_720.jpg',
                                ),
                                radius: 45.r,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
                      padding: EdgeInsets.only(top: 30.h, bottom: 16.h),
                      child: Text(
                        accountDetails,
                        style: PayNestTheme.title_2_16primaryColor
                            .copyWith(color: PayNestTheme.black),
                      ),
                    ),
                    TextFormField(
                      controller: firstNameController,
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        labelText: firstName,
                        labelStyle: PayNestTheme.h2_14textGrey.copyWith(
                          color: PayNestTheme.primaryColor,
                          fontFamily: 'montserratBold',
                          fontSize: sizes.fontRatio * 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(0.3),
                          ),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacer(8),
                    TextFormField(
                      controller: lastNameController,
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        labelText: lastName,
                        labelStyle: PayNestTheme.h2_14textGrey.copyWith(
                          color: PayNestTheme.primaryColor,
                          fontFamily: 'montserratBold',
                          fontSize: sizes.fontRatio * 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(0.3),
                          ),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacer(8),
                    TextFormField(
                      controller: emailController,
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        labelText: emailAddress,
                        labelStyle: PayNestTheme.h2_14textGrey.copyWith(
                          color: PayNestTheme.primaryColor,
                          fontFamily: 'montserratBold',
                          fontSize: sizes.fontRatio * 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(0.3),
                          ),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacer(8),
                    TextFormField(
                      controller: phoneNumberController,
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                      enabled: false,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        labelText: phoneNumber,
                        labelStyle: PayNestTheme.h2_14textGrey.copyWith(
                          color: PayNestTheme.primaryColor,
                          fontFamily: 'montserratBold',
                          fontSize: sizes.fontRatio * 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(0.3),
                          ),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacer(8),
                    TextFormField(
                      controller: emiratesIdController,
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                      inputFormatters: <TextInputFormatter>[
                        EmiratesIdFormatter(
                          mask: 'xxx-xxxx-xxxxxxx-x',
                          separator: '-',
                        )
                      ],
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        labelText: emiratesIDD,
                        labelStyle: PayNestTheme.h2_14textGrey.copyWith(
                          color: PayNestTheme.primaryColor,
                          fontFamily: 'montserratBold',
                          fontSize: sizes.fontRatio * 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(0.3),
                          ),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacer(8),
                    TextFormField(
                      controller: expiryDateController,
                      style: PayNestTheme.title_3_16blackbold.copyWith(
                        fontSize: sizes.fontRatio * 16,
                        color: PayNestTheme.lightBlack,
                        fontFamily: 'montserratSemiBold',
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        labelText: expiry,
                        labelStyle: PayNestTheme.h2_14textGrey.copyWith(
                          color: PayNestTheme.primaryColor,
                          fontFamily: 'montserratBold',
                          fontSize: sizes.fontRatio * 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(0.3),
                          ),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacer(70),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: PayNestTheme.primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              14,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: verticalValue(16),
                          ),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            updateProfile,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: PayNestTheme.colorWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
