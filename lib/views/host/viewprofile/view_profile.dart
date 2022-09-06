import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/views/host/changepassword/change_password.dart';
import 'package:paynest_flutter_app/views/host/editprofile/edit_profile.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../constants/constants.dart';
import '../../../production_main.dart';
import '../../../res/assets.dart';
import '../../../res/res.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/emirates_id_add_dash_function.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  final UserController userController = Get.find<UserController>();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void initState() {
    passwordController.text = '********';
    super.initState();
  }

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
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(24.r))),
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
                              Spacer(),
                              Text(
                                myProfile,
                                style: PayNestTheme.title20white.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'montserratBold',
                                    fontSize: sizes.fontRatio * 18),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 25.h,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      12.r,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfilePage(),
                                        ),
                                      );
                                    },
                                    padding: EdgeInsets.zero,
                                    icon: Lottie.asset(
                                      editAnimation,
                                      repeat: true,
                                    ),
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
                                  verticalSpacer(10),
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
                                    blurRadius: 16,
                                    offset: Offset(
                                      0,
                                      0,
                                    ),
                                  ),
                                ],
                              ),
                              child: userController.userResData.value.parent!
                                              .profileImage ==
                                          null &&
                                      userController.userResData.value.parent!
                                              .profileImage !=
                                          ""
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        userController.userResData.value.parent!
                                            .profileImage,
                                      ),
                                    )
                                  : Container(
                                      height: sizes.heightRatio * 80,
                                      width: sizes.widthRatio * 80,
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
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                  vertical: verticalValue(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacer(20),
                    Text(
                      accountDetails,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 16,
                      ),
                    ),
                    verticalSpacer(16),
                    Text(
                      fullName,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(4),
                    Obx(
                      () => Text(
                        userController.userResData.value.parent!.firstName +
                            " " +
                            userController.userResData.value.parent!.lastName,
                        style: PayNestTheme.title_3_16blackbold.copyWith(
                          fontSize: sizes.fontRatio * 16,
                          color: PayNestTheme.lightBlack,
                          fontFamily: 'montserratSemiBold',
                        ),
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(12),
                    Text(
                      email,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Obx(
                      () => Text(
                        userController.userResData.value.parent!.email,
                        style: PayNestTheme.title_3_16blackbold.copyWith(
                          fontSize: sizes.fontRatio * 16,
                          color: PayNestTheme.lightBlack,
                          fontFamily: 'montserratSemiBold',
                        ),
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(12),
                    Text(
                      phoneNumber,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Obx(
                      () => Text(
                        '${userController.userResData.value.parent!.dialCode} ${userController.userResData.value.parent!.phone}',
                        style: PayNestTheme.title_3_16blackbold.copyWith(
                          fontSize: sizes.fontRatio * 16,
                          color: PayNestTheme.lightBlack,
                          fontFamily: 'montserratSemiBold',
                        ),
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(12),
                    Text(
                      emiratesIDD,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            userController.userResData.value.parent!.emiratesId
                                        .length >=
                                    14
                                ? getDashedEmiratesId(userController
                                    .userResData.value.parent!.emiratesId)
                                : userController
                                    .userResData.value.parent!.emiratesId,
                            style: PayNestTheme.title_3_16blackbold.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.lightBlack,
                              fontFamily: 'montserratSemiBold',
                            ),
                          ),
                          Spacer(),
                          Text(
                            optional,
                            style: PayNestTheme.h2_14textGrey.copyWith(
                              color: PayNestTheme.primaryColor.withOpacity(0.5),
                              fontSize: sizes.fontRatio * 8,
                              fontFamily: 'montserratBold',
                            ),
                          ),
                          horizontalSpacer(8),
                        ],
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(12),
                    Text(
                      expiry,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            userController.userResData.value.parent!
                                            .expiryDate ==
                                        null ||
                                    userController.userResData.value.parent!
                                        .expiryDate.isEmpty
                                ? '-'
                                : '${dateFormat.format(DateTime.parse(userController.userResData.value.parent!.expiryDate.toString().substring(0, 10)))}',
                            style: PayNestTheme.title_3_16blackbold.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.lightBlack,
                              fontFamily: 'montserratSemiBold',
                            ),
                          ),
                          Spacer(),
                          Text(
                            optional,
                            style: PayNestTheme.h2_14textGrey.copyWith(
                              color: PayNestTheme.primaryColor.withOpacity(0.5),
                              fontSize: sizes.fontRatio * 8,
                              fontFamily: 'montserratBold',
                            ),
                          ),
                          horizontalSpacer(8),
                        ],
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(12),
                    Text(
                      passportNumber,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            userController.userResData.value.parent?.passport ??
                                '',
                            style: PayNestTheme.title_3_16blackbold.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.lightBlack,
                              fontFamily: 'montserratSemiBold',
                            ),
                          ),
                          Spacer(),
                          Text(
                            optional,
                            style: PayNestTheme.h2_14textGrey.copyWith(
                              color: PayNestTheme.primaryColor.withOpacity(0.5),
                              fontSize: sizes.fontRatio * 8,
                              fontFamily: 'montserratBold',
                            ),
                          ),
                          horizontalSpacer(8),
                        ],
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(12),
                    Text(
                      expiry,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 12,
                      ),
                    ),
                    verticalSpacer(8),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            userController.userResData.value.parent!
                                            .expiryDate ==
                                        null ||
                                    userController.userResData.value.parent!
                                        .expiryDate.isEmpty
                                ? '-'
                                : '${dateFormat.format(DateTime.parse(userController.userResData.value.parent!.expiryDate.toString().substring(0, 10)))}',
                            style: PayNestTheme.title_3_16blackbold.copyWith(
                              fontSize: sizes.fontRatio * 16,
                              color: PayNestTheme.lightBlack,
                              fontFamily: 'montserratSemiBold',
                            ),
                          ),
                          Spacer(),
                          Text(
                            optional,
                            style: PayNestTheme.h2_14textGrey.copyWith(
                              color: PayNestTheme.primaryColor.withOpacity(0.5),
                              fontSize: sizes.fontRatio * 8,
                              fontFamily: 'montserratBold',
                            ),
                          ),
                          horizontalSpacer(8),
                        ],
                      ),
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(16),
                    Text(
                      passwordDetail,
                      style: PayNestTheme.title_2_16primaryColor.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                      ),
                    ),
                    verticalSpacer(8),
                    Text(
                      password,
                      style: PayNestTheme.h2_14textGrey.copyWith(
                        color: PayNestTheme.primaryColor,
                        fontFamily: 'montserratBold',
                        fontSize: sizes.fontRatio * 16,
                      ),
                    ),
                    verticalSpacer(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '*******',
                          style: PayNestTheme.title_3_16blackbold.copyWith(
                            fontSize: sizes.fontRatio * 16,
                            color: PayNestTheme.lightBlack,
                            fontFamily: 'montserratSemiBold',
                          ),
                        ),
                        SvgPicture.asset(
                          AppAssets.passwordEye,
                          color: PayNestTheme.primaryColor,
                        ),
                      ],
                    ),
                    verticalSpacer(8),
                    Container(
                      width: 1.sw,
                      height: 1.h,
                      color: PayNestTheme.lineColor,
                    ),
                    verticalSpacer(16),
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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            changePassword,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: PayNestTheme.colorWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpacer(16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
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
                            deleteAccount,
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
          ),
        ],
      ),
    );
  }
}
