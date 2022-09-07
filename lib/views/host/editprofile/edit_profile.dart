import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/updateprofile_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:paynest_flutter_app/widgets/emirates_id_add_dash_function.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';
import '../../../production_main.dart';
import '../../../res/res.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/editing_text_emirates_id_formater.dart';
import '../../../widgets/inkwell_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final UserController userController = Get.find<UserController>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emiratesIdController = TextEditingController();
  UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());

  DateTime tempPickedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(
      text: userController.userResData.value.parent!.email,
    );
    firstNameController = TextEditingController(
        text: userController.userResData.value.parent!.firstName);
    lastNameController = TextEditingController(
      text: userController.userResData.value.parent!.lastName,
    );
    expiryDate = TextEditingController(
      text: userController.userResData.value.parent!.expiryDate == null ||
              userController.userResData.value.parent!.expiryDate
                  .toString()
                  .isEmpty
          ? '-'
          : '${dateFormat.format(DateTime.parse(userController.userResData.value.parent!.expiryDate.toString().substring(0, 10)))}',
    );
    emiratesIdController = TextEditingController(
      text: userController.userResData.value.parent!.emiratesId.length >= 14
          ? getDashedEmiratesId(
              userController.userResData.value.parent!.emiratesId)
          : userController.userResData.value.parent!.emiratesId,
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
                              AppBarBackButton(
                                iconColor: PayNestTheme.primaryColor,
                                buttonColor: PayNestTheme.colorWhite,
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
                              child: Container(
                                height: sizes.heightRatio * 60,
                                width: sizes.widthRatio * 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  icMale,
                                ),
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
                        if (value!.trim().isEmpty) {
                          return 'Please enter email';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                    ),
                    verticalSpacer(8),
                    InkWellWidget(
                      onTap: () {
                        showDialog(
                          builder: (sdCTX) {
                            return AlertDialog(
                              title: Row(
                                children: [
                                  InkWellWidget(
                                    onTap: () {
                                      Navigator.pop(sdCTX);
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: PayNestTheme.blueAccent,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Done",
                                          style: PayNestTheme.small_2_12white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              content: SizedBox(
                                width: .9.sw,
                                height: .5.sh,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (DateTime dateTime) {
                                    tempPickedDate = dateTime;
                                    expiryDate.text =
                                        dateFormat.format(dateTime).toString();
                                  },
                                  initialDateTime: DateTime.parse(userController
                                      .userResData.value.parent!.expiryDate
                                      .toString()
                                      .substring(0, 10)),
                                ),
                              ),
                            );
                          },
                          context: context,
                        );
                      },
                      child: TextFormField(
                        controller: expiryDate,
                        enabled: false,
                        style: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontSize: sizes.fontRatio * 14,
                          color: PayNestTheme.textGrey,
                        ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(
                                0.5,
                              ),
                            ),
                          ),
                          labelText: expiry,
                          labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.primaryColor,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(
                                0.5,
                              ),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(
                                0.5,
                              ),
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(
                                0.5,
                              ),
                            ),
                          ),
                          errorStyle:
                              PayNestTheme.title_2_16primaryColor.copyWith(
                            fontSize: sizes.fontRatio * 12,
                            color: PayNestTheme.red,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: PayNestTheme.textGrey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
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
                    verticalSpacer(70),
                    Obx(
                      () => Container(
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
                          onPressed: () async {
                            if (Utils.editProfileFormKey.currentState!
                                .validate()) {
                              await updateProfileController.hitUpdateProfile(
                                userController.userResData.value.parent?.id,
                                firstNameController.text.toString(),
                                lastNameController.text.toString(),
                                emailController.text.toString(),
                                tempPickedDate.toString(),
                                emiratesIdController.text
                                    .toString()
                                    .replaceAll('-', ''),
                                userController,
                              );
                              if (updateProfileController
                                      .updateProfileData.value.status ==
                                  true) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      updateProfileController.message.value
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      updateProfileController.isFailed.value
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Email field is empty',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                          },
                          child: !updateProfileController.isLoading.value
                              ? Text(updateProfile,
                                  style: PayNestTheme.subtitle16white.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'montserratBold',
                                  ))
                              : Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: PayNestTheme.colorWhite,
                                    color: PayNestTheme.blueAccent,
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
