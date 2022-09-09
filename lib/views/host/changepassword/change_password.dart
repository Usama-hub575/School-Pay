import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paynest_flutter_app/constants/constants.dart';
import 'package:paynest_flutter_app/controller/passwordreset_controller.dart';
import 'package:paynest_flutter_app/controller/user_controller.dart';
import 'package:paynest_flutter_app/theme/theme.dart';
import 'package:paynest_flutter_app/utils/utils.dart';
import 'package:paynest_flutter_app/widgets/spacer.dart';

import '../../../res/assets.dart';
import '../../../res/res.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/toast.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController rePassController = TextEditingController();
  PasswordResetController resetController = Get.put(PasswordResetController());
  final UserController userController = Get.find<UserController>();

  // final FocusNode inputFocusNode = FocusNode();

  bool isObscure = true;
  bool isObscurenew = true;
  bool isObscurere = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        child: Column(
          children: [
            Container(
              height: 129.h,
              decoration: BoxDecoration(
                  color: PayNestTheme.primaryColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(24.r))),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          AppBarBackButton(
                            iconColor: PayNestTheme.primaryColor,
                            buttonColor: PayNestTheme.colorWhite,
                          ),
                          Text(
                            chgPassword,
                            style: PayNestTheme.title20white.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'montserratBold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalValue(16),
                vertical: verticalValue(16),
              ),
              child: Form(
                key: Utils.changePasswordFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: oldPassController,
                      enabled: true,
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
                        labelText: oldPassword,
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
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(0.5),
                          ),
                        ),
                        errorStyle: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontSize: sizes.fontRatio * 12,
                          color: PayNestTheme.red,
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.trim().length < 5) {
                          return 'Password must not be less than 5';
                        }
                        return null;
                      },
                    ),
                    verticalSpacer(12),
                    TextFormField(
                      controller: newPassController,
                      obscureText: isObscure,
                      enabled: true,
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
                        labelText: newPassword,
                        labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                          fontSize: sizes.fontRatio * 12,
                          color: PayNestTheme.primaryColor,
                        ),
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                            AppAssets.passwordEye,
                            color: PayNestTheme.primaryColor,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                isObscure = !isObscure;
                              },
                            );
                          },
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
                        errorStyle: PayNestTheme.title_2_16primaryColor.copyWith(
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
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.trim().length < 5) {
                          return 'Password must not be less than 5';
                        }
                        return null;
                      },
                    ),
                    verticalSpacer(12),
                    TextFormField(
                      controller: rePassController,
                      obscureText: isObscure,
                      enabled: true,
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
                        labelText: confirmPassword,
                        labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                          fontSize: sizes.fontRatio * 12,
                          color: PayNestTheme.primaryColor,
                        ),
                        errorStyle: PayNestTheme.title_2_16primaryColor.copyWith(
                          fontSize: sizes.fontRatio * 12,
                          color: PayNestTheme.red,
                        ),
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                            AppAssets.passwordEye,
                            color: PayNestTheme.primaryColor,
                          ),
                          onPressed: () {
                            setState(
                              () {
                                isObscure = !isObscure;
                              },
                            );
                          },
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
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PayNestTheme.textGrey.withOpacity(0.5),
                          ),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.trim().length < 5) {
                          return 'Password must not be less than 5';
                        }
                        if(newPassController.text != rePassController.text){
                          return 'New password and confirm password not matched';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Obx(
              () => Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalValue(16),
                ),
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
                    if (Utils.changePasswordFormKey.currentState!.validate()) {
                      await resetController.hitResetPassword(
                          userController.userResData.value.parent!.id
                              .toString(),
                          oldPassController.text,
                          newPassController.text);
                      if (resetController.resetPassData.value.status == true) {
                        oldPassController.clear();
                        newPassController.clear();
                        rePassController.clear();

                        showToast(
                            context: context,
                            messege:  "Password Reset Successfully",
                            color: PayNestTheme.paidGreen);
                        Navigator.pop(context);
                      } else {
                        showToast(
                            context: context,
                            messege:    resetController.resetPassData.value.message
                                .toString(),
                            color: PayNestTheme.red);
                      }
                    }
                  },
                  child: Center(
                    child: !resetController.isLoading.value
                        ? Text(
                            changePassword,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: PayNestTheme.colorWhite,
                            ),
                          )
                        : CircularProgressIndicator(
                            backgroundColor: PayNestTheme.colorWhite,
                            color: PayNestTheme.blueAccent,
                          ),
                  ),
                ),
              ),
            ),
            verticalSpacer(16),
          ],
        ),
      ),
    );
  }
}
