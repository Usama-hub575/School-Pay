import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:paynest_flutter_app/controller/register_controller.dart';

import '../../../constants/constants.dart';
import '../../../controller/user_controller.dart';
import '../../../res/assets.dart';
import '../../../res/res.dart';
import '../../../theme/theme.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/spacer.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  UserController userController = Get.put(UserController());
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RegisterController registerController = RegisterController();
  bool isObscure = true;
  bool cPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(16),
        ),
        child: Column(
          children: [
            verticalSpacer(40),
            Row(
              children: [
                Container(
                  height: 54.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                      color: PayNestTheme.primaryColor,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    icon: Icon(Icons.arrow_back,
                        size: 20.sp, color: PayNestTheme.colorWhite),
                    // child: Text(""),
                  ),
                ),
                Spacer(),
                Image.asset(
                  welcomeRegisterLogo,
                  width: sizes.widthRatio * 120,
                ),
                Spacer(),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  Form(
                    key: Utils.newPasswordKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacer(80),
                        Text(
                          'New Password',
                          style: PayNestTheme.h2_12blueAccent.copyWith(
                            fontSize: sizes.fontRatio * 20,
                            color: PayNestTheme.primaryColor,
                          ),
                        ),
                        verticalSpacer(16),
                        Container(
                          child: TextFormField(
                            controller: otpController,
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
                              labelText: otp,
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
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Required';
                              }
                              // Check if the entered email has the right format
                              if (value.trim().length < 4) {
                                return 'OTP must not be less than 4';
                              }
                              if (value.trim().length > 4) {
                                return 'OTP must not be grater than 4';
                              }
                              // Return null if the entered email is valid
                              return null;
                            },
                          ),
                        ),
                        verticalSpacer(16),
                        Container(
                          child: TextFormField(
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: PayNestTheme.textGrey,
                            ),
                            obscureText: isObscure,
                            obscuringCharacter: '*',
                            controller: newPasswordController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(
                                    0.5,
                                  ),
                                ),
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              labelText: newPassword,
                              labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: PayNestTheme.primaryColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Required';
                              }
                              // Check if the entered email has the right format
                              if (value.trim().length < 4) {
                                return 'New Password must not be less than 4';
                              }
                              // Return null if the entered email is valid
                              return null;
                            },
                          ),
                        ),
                        verticalSpacer(16),
                        Container(
                          child: TextFormField(
                            controller: confirmPasswordController,
                            obscureText: cPassword,
                            style: PayNestTheme.title_2_16primaryColor.copyWith(
                              fontSize: sizes.fontRatio * 14,
                              color: PayNestTheme.textGrey,
                            ),
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(
                                    0.5,
                                  ),
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: SvgPicture.asset(
                                  AppAssets.passwordEye,
                                  color: PayNestTheme.primaryColor,
                                ),
                                onPressed: () {
                                  setState(
                                        () {
                                      cPassword = !cPassword;
                                    },
                                  );
                                },
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              labelText: confirmPassword,
                              labelStyle: PayNestTheme.h2_12blueAccent.copyWith(
                                fontSize: sizes.fontRatio * 12,
                                color: PayNestTheme.primaryColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: PayNestTheme.textGrey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Required';
                              }
                              if (value.trim().length < 4) {
                                return 'Confirm Password must not be less than 4';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(60),
                  Obx(
                        () => Container(
                      width: double.infinity,
                      height: sizes.heightRatio * 46,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: PayNestTheme.primaryColor,
                          elevation: 0,
                          // side: BorderSide(width:1, color:Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            CustomAlertDialog.baseDialog(
                              context: context,
                              title: "Success!",
                              message:
                              "Email Send Successfully",
                              showCrossIcon: false,
                              buttonAction: () {
                                Navigator.of(context).pop();
                              },
                            );
                          });
                        },
                        child: !userController.isLoading.value
                            ? Text("Reset Password",
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
          ],
        ),
      ),
    );
  }
}
